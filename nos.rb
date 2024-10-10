class Nos < Formula
  version "0.0.8"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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
