class Dot < Formula
  version "0.6.0"
  sha256 "2be87028a16d9f493f29618b52687075530d2caef72a1daec630c17a49f851da"

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
