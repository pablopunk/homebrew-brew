#!/bin/bash

path=$1

if [ -z "$path" ]; then
    echo "Usage: $0 path/to/package.rb"
    exit 1
fi

current_version=$(sed -n '/version/p' $path | head -n1 | cut -d'"' -f2)
echo "Current version: $current_version"

echo "Checking if there's a newer version"
# Extract repo from homepage instead of url (since url might be binary-specific)
homepage=$(sed -n '/homepage/p' $path | cut -d '"' -f2)
repo=$(echo $homepage | cut -d "/" -f4-5)
latest_version=$(curl -sL https://api.github.com/repos/$repo/releases/latest | grep tag_name | cut -d '"' -f4)

if [[ "$current_version" == "$latest_version" ]]; then
  echo "Version is up to date: $current_version, but checking SHA256 hashes..."
else
  echo "Updating to version $latest_version"
fi

# Check if this is a binary release formula (has on_macos/on_linux blocks)
if grep -q "on_macos\|on_linux" $path; then
  echo "Detected binary release formula, checking SHA256 hashes"
  
  # Get all release assets
  assets=$(curl -sL https://api.github.com/repos/$repo/releases/latest | jq -r '.assets[] | "\(.name) \(.browser_download_url)"')
  
  needs_update=false
  version_updated=false
  
  # Check SHA256 for each platform binary
  while IFS= read -r line; do
    if [[ -n "$line" ]]; then
      asset_name=$(echo "$line" | cut -d ' ' -f1)
      asset_url=$(echo "$line" | cut -d ' ' -f2)
      
      # Find the line number of the URL containing this asset name
      line_num=$(grep -n "$asset_name" $path | cut -d: -f1)
      if [[ -n "$line_num" ]]; then
        # Get current SHA256 from formula
        next_sha_line=$((line_num + 1))
        current_sha=$(sed -n "${next_sha_line}p" $path | cut -d '"' -f2)
        
        echo "Checking $asset_name (current SHA: ${current_sha:0:12}...)"
        curl -sL -o "tmp_$asset_name" "$asset_url"
        
        if command -v sha256sum > /dev/null; then
          actual_sha=$(sha256sum "tmp_$asset_name" | cut -d " " -f1)
        else
          actual_sha=$(shasum -a 256 "tmp_$asset_name" | cut -d " " -f1)
        fi
        rm "tmp_$asset_name"
        
        if [[ "$current_sha" != "$actual_sha" ]]; then
          echo "SHA256 mismatch for $asset_name, updating..."
          echo "  Current: $current_sha"
          echo "  Actual:  $actual_sha"
          
          # Update version first if not already done
          if [[ "$version_updated" == "false" ]]; then
            sed -i '' "s/version \".*\"/version \"$latest_version\"/g" $path
            version_updated=true
          fi
          
          # Update SHA256 for this specific binary
          sed -i '' "${next_sha_line}s/sha256 \".*\"/sha256 \"$actual_sha\"/" $path
          needs_update=true
        else
          echo "SHA256 matches for $asset_name ✓"
        fi
      fi
    fi
  done <<< "$assets"
  
  if [[ "$needs_update" == "false" ]]; then
    echo "All SHA256 hashes are up to date"
    exit 0
  fi
  
else
  echo "Detected source release formula, checking SHA256"
  
  # Get current SHA256 from formula
  current_sha=$(sed -n '/sha256/p' $path | cut -d '"' -f2)
  
  # Original logic for source-based formulas
  url=$(sed -n '/url/p' $path | cut -d '"' -f2)
  url=$(echo $url | sed "s/#{version}/$latest_version/g")
  echo "Downloading $url"
  curl -sL -o tmp_file $url
  
  echo "Calculating sha256"
  if command -v sha256sum > /dev/null; then
    actual_sha=$(sha256sum tmp_file | cut -d " " -f1)
  else
    actual_sha=$(shasum -a 256 tmp_file | cut -d " " -f1)
  fi
  rm tmp_file
  
  echo "Current SHA: ${current_sha:0:12}..."
  echo "Actual SHA:  ${actual_sha:0:12}..."
  
  if [[ "$current_sha" == "$actual_sha" ]]; then
    echo "SHA256 matches, no update needed ✓"
    exit 0
  fi
  
  echo "SHA256 mismatch, updating..."
  echo "  Current: $current_sha"
  echo "  Actual:  $actual_sha"
  
  sed -i '' "s/sha256 \".*\"/sha256 \"$actual_sha\"/g" $path
  sed -i '' "s/version \".*\"/version \"$latest_version\"/g" $path
fi

if [ "$?" != "0" ]; then
  echo "Failed to update $path"
else
  echo "Successfully updated $path"
  package=$(echo $path | cut -d "." -f1 | cut -d "/" -f2)
  git commit -am "$package@$latest_version" && git push
fi
