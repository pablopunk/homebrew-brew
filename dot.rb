class Dot < Formula
  version "0.1.1"
  sha256 "6bff25b6489a49a438b505ed1c5682a1a122423238ae5bea0af86bbe46053a66"

  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/dot"
  url "https://github.com/pablopunk/dot/archive/refs/tags/#{version}.tar.gz"
  license "MIT"

  depends_on "lua"

  def install
    bin.install "dot.lua" => "dot"
  end

  test do
    system "#{bin}/dot", "--version"
  end
end
