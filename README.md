# My Homebrew Tap

You can install my tap using:

```bash
brew tap pablopunk/brew
```

And then install any package you like:

```bash
brew install swift-shift
```

Alternatively, you can install the packages directly without adding the tap:

```bash
brew install pablopunk/brew/dot # or any other package
```

If you've detected that a package is outdated, you can create a PR to update it using the provided script. Fork the repository, then run:

```bash
git clone <your fork url>
cd homebrew-brew
./update.sh <package> # for example ./update.sh Casks/swift-shift.rb
```

Then commit the changes and open a PR.

