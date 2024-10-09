version=$1

if [ -z "$version" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

curl -sL -o nos-$version.tar.gz https://github.com/pablopunk/nos/archive/refs/tags/$version.tar.gz

sha256sum nos-$version.tar.gz

rm nos-$version.tar.gz
