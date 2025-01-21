class Odf < Formula
  version "3.0.0"
  sha256 "363b68c40d6a7e9e000a3f514e328bc730cc42f75942db38420efdb03388ac5e"

  desc "Open Diff Files. Open git-modified files in your favorite editor."
  homepage "https://github.com/pablopunk/odf"
  url "https://github.com/pablopunk/odf/archive/refs/tags/#{version}.tar.gz"
  license "MIT"

  def install
    bin.install "odf" => "odf"
  end
end
