class Dot < Formula
  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/dot"
  version "4.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-darwin-x64"
      sha256 "6dc24a26806b3bd94fd058d7671f5fb9e1527cbf0e271acb3c241f6c551812c0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-darwin-arm64"
      sha256 "a225753db2efb0fb26a014860260612b52951cfcc875541a073bce74acdf8a94"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-linux-x64"
      sha256 "731b3c876a2ef144d614dde022b784d9931d039eade73a780d570af1086479a9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-linux-arm64"
      sha256 "aba02af343b1d6758d513d3d08b51b6576e4bb13ede47c086f77625f3b50b7b6"
    end
  end

  def install
    bin.install Dir["*"].first => "dot"
  end

  test do
    system "#{bin}/dot", "--version"
  end
end
