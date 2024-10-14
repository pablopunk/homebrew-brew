class Odf < Formula
  version "2.3.3"
  sha256 "398cd0025a76037a68eec8f54d62c8418c1d59f5113c928b4db5695f0f1afbb9"

  desc "Open Diff Files. Open git-modified files in your favorite editor."
  homepage "https://github.com/pablopunk/odf"
  url "https://github.com/pablopunk/odf/archive/refs/tags/#{version}.tar.gz"
  license "MIT"

  def install
    bin.install "odf" => "odf"
  end
end
