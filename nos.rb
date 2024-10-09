class Nos < Formula
  desc "Manage your dotfiles and their dependencies automagically"
  homepage "https://github.com/pablopunk/nos"
  url "https://github.com/pablopunk/nos/archive/refs/tags/0.0.4.tar.gz"
  sha256 "f9e071224a0d0c9acd19758deacc6a46279465a3933e0ed2c205ec385e2ae384"
  license "MIT"

  depends_on "lua"

  def install
    bin.install "nos.lua" => "nos"
  end

  test do
    system "#{bin}/nos", "--version"
  end
end
