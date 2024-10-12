class Dot < Formula
  version "0.1.0"
  sha256 "df5d7254891b4ad78dfc05a41688b91e328692c3ec14d3aece5efbe119e13e29"

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
