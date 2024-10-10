package=$1
version=$2

if [ -z "$package" ]; then
    echo "Usage: $0 <package>"
    exit 1
fi

if [ "$package" == "swift-shift" ]; then
    url=$(sed -n '/url/p' Casks/$package.rb | cut -d '"' -f2)
    curl -sL -o $package.zip $url
    sha256sum $package.zip
    rm $package.zip
    exit 0
else
    url=$(sed -n '/url/p' $package.rb | cut -d '"' -f2)
    curl -sL -o $package.tar.gz $url
    sha256sum $package.tar.gz
    rm $package.tar.gz
fi
