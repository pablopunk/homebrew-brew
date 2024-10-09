class Nos < Formula
  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/nos"
  url "https://github.com/pablopunk/nos/archive/refs/tags/0.0.2.tar.gz"
  sha256 "75e0fa855384690bfadb134e1fda7a5cb2a8cb9272d1f0a784f7b174efefa871"
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
