class Nos < Formula
  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/nos"
  url "https://github.com/pablopunk/nos/archive/refs/tags/0.0.1.tar.gz"
  sha256 "fc597c77c1d5ecdd1b6d36e80133073b9fedd43ed13e1d7c2d165396aa0b0fb9"
  license "MIT"

  depends_on "lua"
  depends_on "luarocks"

  def install
    ENV["LUA_PATH"] = "#{buildpath}/?.lua;;"
    system "luarocks", "install", "--local", "luafilesystem"
    bin.install "nos.lua" => "nos"
  end

  test do
    system "#{bin}/nos", "--version"
  end
end
