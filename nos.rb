class Nos < Formula
  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/nos"
  url "https://github.com/pablopunk/nos/archive/refs/tags/0.0.3.tar.gz"
  sha256 "d9fc1b80ddaf05fcaa0c6c9c475088cff8ec759bccfaf37437c7de707b23fca5"
  license "MIT"

  depends_on "lua"

  def install
    bin.install "nos.lua" => "nos"
  end

  test do
    system "#{bin}/nos", "--version"
  end
end
