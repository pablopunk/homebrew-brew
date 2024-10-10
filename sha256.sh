package=$1
version=$2

if [ -z "$version" ]; then
    echo "Usage: $0 <package> <version>"
    exit 1
fi

if [ "$package" == "swifthi-shift" ]; then
    curl -sL -o SwiftShift.zip https://github.com/pablopunk/$package/releases/download/$version/$package.zip
    sha256sum SwiftShift.zip
    rm SwiftShift.zip
    exit 0
else
    curl -sL -o $package-$version.tar.gz https://github.com/pablopunk/$package/archive/refs/tags/$version.tar.gz
    sha256sum $package-$version.tar.gz
    rm $package-$version.tar.gz
fi
