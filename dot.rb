class Dot < Formula
  version "0.5.0"
  sha256 "95b262cfc2c3f8465544983ca34a879c15ed6b63b70c1a51827950ea6169b45e"

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
