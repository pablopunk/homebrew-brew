class Odf < Formula
  version "2.3.4"
  sha256 "d6fc4b142d7e5103a0791a17fab964b03f5fe97eb7fec892028570c34db34c36"

  desc "Open Diff Files. Open git-modified files in your favorite editor."
  homepage "https://github.com/pablopunk/odf"
  url "https://github.com/pablopunk/odf/archive/refs/tags/#{version}.tar.gz"
  license "MIT"

  def install
    bin.install "odf" => "odf"
  end
end
