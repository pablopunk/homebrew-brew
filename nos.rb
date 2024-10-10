class Nos < Formula
  version "0.0.8"
  sha256 "3899787657baa807808b09dec67ae240ad4ecc71e21880fbcf3c40a3ae9afa25"

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
