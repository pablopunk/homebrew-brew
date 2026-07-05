class Dot < Formula
  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/dot"
  version "4.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-darwin-x64"
      sha256 "1353dff424cd0c58c356783ee22691c05504b1d69b024f858c46d98e0a868afb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-darwin-arm64"
      sha256 "b36f2626b5777fd915c5050a37c58ecc1ef0a50d79b0851469b16a44db00fe89"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-linux-x64"
      sha256 "cab823ddd78182d564e0a491991752faeed6d9285df34c40a5dc13034ee00e75"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-linux-arm64"
      sha256 "e97773e462be1132ae65227c18f4fa08c528729d84c3cb1d50e9afb198703f9e"
    end
  end

  def install
    bin.install Dir["*"].first => "dot"
  end

  test do
    system "#{bin}/dot", "--version"
  end
end
