class Dot < Formula
  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/dot"
  version "4.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-darwin-x64"
      sha256 "2d5751fe6f9e190eb66252aa0e5f948eb5b4b6cc5cb97a401ab0107a642abfae"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-darwin-arm64"
      sha256 "0907a7dff4b0125db2092fb05964f456b0355ef5f8c781c38dc227f34757403b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-linux-x64"
      sha256 "3f6d143d464bd67805643521adb20e1fd1a5695e1cc94e5dddfd04705cb7d4b0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-linux-arm64"
      sha256 "25be2ee8d717ec44865b0b55d862503d53d395195f40cb53c2918dab77d74634"
    end
  end

  def install
    bin.install Dir["*"].first => "dot"
  end

  test do
    system "#{bin}/dot", "--version"
  end
end
