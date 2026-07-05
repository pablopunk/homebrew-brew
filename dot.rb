class Dot < Formula
  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/dot"
  version "4.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-darwin-x64"
      sha256 "cd972cb0364edadffe2a363f7ddb512df7d2193e291e38c98c2c753f6f65b154"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-darwin-arm64"
      sha256 "313aef538f10235fcf9fbd03743bfe20a7d867011190a7de394048a93f5760a2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-linux-x64"
      sha256 "954584d8ff9056d6335051a1bb9f76693f243499ecf7567ddb28d46dc2010907"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-linux-arm64"
      sha256 "760b97df35b27913d67bd9addf2f96bee2204cee0858bcc5cb1ad8ab908ed502"
    end
  end

  def install
    bin.install Dir["*"].first => "dot"
  end

  test do
    system "#{bin}/dot", "--version"
  end
end
