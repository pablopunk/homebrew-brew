class Dot < Formula
  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/dot"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/#{version}/dot-darwin-amd64"
      sha256 "d23ca474819c124fd04a7d070e0d17fb4476f8de2776ab2bcc8693df1c0484a6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/#{version}/dot-darwin-arm64"
      sha256 "eca085775f639174487dfb0f306c981f193b67845be76cc2d3567d5b06915bda"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/#{version}/dot-linux-amd64"
      sha256 "19caf29f7da35c216fff34c6fc62b08bc93d4c4695fcb6b9f10f21647cf4ca0f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/#{version}/dot-linux-arm64"
      sha256 "21d70f768c1b699c1c2bb168ff24184d623fadd710a8b0934943987ac1151f1c"
    end
  end

  def install
    bin.install Dir["*"].first => "dot"
  end

  test do
    system "#{bin}/dot", "--version"
  end
end
