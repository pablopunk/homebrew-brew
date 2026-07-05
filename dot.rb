class Dot < Formula
  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/dot"
  version "4.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-darwin-x64"
      sha256 "ac5757525c25fc90585a9aea040d6915ada4f333ce9050e975b7eab3066b555a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-darwin-arm64"
      sha256 "226eb2e4ccb992d19f0f80a4fe8bad6f985cf36acad097d2bd7e6fe6e1e065e7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-linux-x64"
      sha256 "d581b2bfa087c9d3804ad6516bbaff449a58cdef07f357b925ae071af837a8f0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pablopunk/dot/releases/download/v#{version}/dot-linux-arm64"
      sha256 "b5c52aa43307d93fa00c48225e1e859ab150e899a55fccb35e48f19e96516c68"
    end
  end

  def install
    bin.install Dir["*"].first => "dot"
  end

  test do
    system "#{bin}/dot", "--version"
  end
end
