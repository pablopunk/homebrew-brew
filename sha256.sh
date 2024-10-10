package=$1

if [ -z "$package" ]; then
    echo "Usage: $0 <package>"
    exit 1
fi

if [ "$package" == "swift-shift" ]; then
    version=$(sed -n '/version/p' Casks/$package.rb | head -n1 | cut -d'"' -f2)
    url=$(sed -n '/url/p' Casks/$package.rb | cut -d '"' -f2)
    url=$(echo $url | sed "s/#{version}/$version/g")
    curl -sL -o $package.zip $url
    sha256sum $package.zip
    rm $package.zip
    exit 0
else
    version=$(sed -n '/version/p' $package.rb | head -n1 | cut -d'"' -f2)
    url=$(sed -n '/url/p' $package.rb | cut -d '"' -f2)
    url=$(echo $url | sed "s/#{version}/$version/g")
    curl -sL -o $package.tar.gz $url
    sha256sum $package.tar.gz
    rm $package.tar.gz
fi
