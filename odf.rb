class Odf < Formula
  version "3.0.2"
  sha256 "5cc5b38e52829458c5ccf345afbb73fb5c0b579c23f235942900f708e9cd5811"

  desc "Open Diff Files. Open git-modified files in your favorite editor."
  homepage "https://github.com/pablopunk/odf"
  url "https://github.com/pablopunk/odf/archive/refs/tags/#{version}.tar.gz"
  license "MIT"

  def install
    bin.install "odf" => "odf"
  end
end
