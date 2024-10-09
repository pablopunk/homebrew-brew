package=$1
version=$2

if [ -z "$version" ]; then
    echo "Usage: $0 <package> <version>"
    exit 1
fi

curl -sL -o $package-$version.tar.gz https://github.com/pablopunk/$package/archive/refs/tags/$version.tar.gz

sha256sum $package-$version.tar.gz

rm $package-$version.tar.gz
