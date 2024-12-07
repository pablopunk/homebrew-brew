class Dot < Formula
  version "0.4.1"
  sha256 "b6233e625f86722749f4a1ee2f964780bb5c8ed87162c5b0cf37e6abafbc9fbc"

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
