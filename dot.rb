class Dot < Formula
  version "0.2.0"
  sha256 "50779dbb7aa0e4ab82449208d0c219f355c4e3ddbcc7c038036fb898bab61e19"

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
