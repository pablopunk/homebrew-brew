class Dot < Formula
  version "0.4.0"
  sha256 "eee1f19ec5cc324d8ef2bd0d84418b23a1ed69625381093ebba4d5a3cf48a0c4"

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
