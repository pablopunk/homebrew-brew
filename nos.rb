class Nos < Formula
  version "0.0.5"
  sha256 "87f5ce9361f8ef1263521ff9b12ca39df00f32a1486753220e55278a11bc3129"

  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/nos"
  url "https://github.com/pablopunk/nos/archive/refs/tags/#{version}.tar.gz"
  license "MIT"

  depends_on "lua"

  def install
    bin.install "nos.lua" => "nos"
  end

  test do
    system "#{bin}/nos", "--version"
  end
end
