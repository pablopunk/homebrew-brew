class Odf < Formula
  version "3.0.1"
  sha256 "7e9be8424f9013581bb784109d1c418e866b886974c007ce30cab4b3db7ec9f6"

  desc "Open Diff Files. Open git-modified files in your favorite editor."
  homepage "https://github.com/pablopunk/odf"
  url "https://github.com/pablopunk/odf/archive/refs/tags/#{version}.tar.gz"
  license "MIT"

  def install
    bin.install "odf" => "odf"
  end
end
