class Edges < Formula
  desc "A lightweight window border tool for macOS"
  homepage "https://github.com/pablopunk/edges"
  license "MIT"
  version "2026.03.28.3"

  on_arm do
    url "https://github.com/pablopunk/edges/releases/download/v2026.03.28.3/edges-2026.03.28.3-aarch64.tar.gz"
    sha256 "117bcdfc2a497d44009817fc28c748c47da40d75426bac8cca2a9521401663d4"
  end

  on_intel do
    url "https://github.com/pablopunk/edges/releases/download/v2026.03.28.3/edges-2026.03.28.3-x86_64.tar.gz"
    sha256 "f82a28ae783af1594cc16fbf3b254f89576aefe137989ea7854a79dcb2b2fd74"
  end

  depends_on :macos

  head "https://github.com/pablopunk/edges.git", branch: "main"
  head do
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "build", "--release"
      bin.install "target/release/edges"
    else
      if Hardware::CPU.arm?
        bin.install "edges-aarch64" => "edges"
      else
        bin.install "edges-x86_64" => "edges"
      end
    end
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
