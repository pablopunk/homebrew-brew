class Dot < Formula
  version "0.3.0"
  sha256 "56e4d1a8589016b16657922e21499d28838e2489fcd3c4394d56fb8e03e13cf2"

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
