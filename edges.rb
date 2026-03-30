class Edges < Formula
  desc "A lightweight window border tool for macOS"
  homepage "https://github.com/pablopunk/edges"
  license "MIT"
  url "https://github.com/pablopunk/edges/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e98b19b297c1dfac083e632bde6a0961cf308c7a9f1cc2e03ac7fea21ba1708c"
  head "https://github.com/pablopunk/edges.git", branch: "main"
  version "0.1.0"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/edges"
  end

  service do
    run "#{opt_bin}/edges"
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    log_path "#{var}/log/edges/edges.out.log"
    error_log_path "#{var}/log/edges/edges.err.log"
  end

  test do
    assert_match "edges", shell_output("#{bin}/edges --version")
  end
end
