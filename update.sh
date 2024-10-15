#!/bin/bash

path=$1

if [ -z "$path" ]; then
    echo "Usage: $0 path/to/package.rb"
    exit 1
fi

current_version=$(sed -n '/version/p' $path | head -n1 | cut -d'"' -f2)
echo "Current version: $current_version"

echo "Checking if there's a newer version"
url=$(sed -n '/url/p' $path | cut -d '"' -f2)
repo=$(echo $url | cut -d "/" -f4-5)
latest_version=$(curl -sL https://api.github.com/repos/$repo/releases/latest | grep tag_name | cut -d '"' -f4)

if [[ "$current_version" == "$latest_version" ]]; then
  echo "$path is already up to date: $current_version"
  exit 0
fi

url=$(echo $url | sed "s/#{version}/$latest_version/g")
echo "Downloading $url"
curl -sL -o tmp_file $url

echo "Calculating sha256"
sha=$(sha256sum tmp_file | cut -d " " -f1)
rm tmp_file

echo "Updating $path to $latest_version"
sed -i '' "s/sha256 \".*\"/sha256 \"$sha\"/g" $path
sed -i '' "s/version \".*\"/version \"$latest_version\"/g" $path

if [ "$?" != "0" ]; then
  echo "Failed to update $path"
else
  echo "Successfully updated $path"
fi
