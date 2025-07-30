class Dot < Formula
  version "1.2.0"
  sha256 "e47518e9a76a4815e9ae56d68b76c8ca4dd3ec44f58d5227c2864e8672bac101"

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
