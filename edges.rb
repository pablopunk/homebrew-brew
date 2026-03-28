class Edges < Formula
  desc "A lightweight window border tool for macOS"
  homepage "https://github.com/pablopunk/edges"
  license "MIT"
  version "2026.03.28.2"

  on_arm do
    url "https://github.com/pablopunk/edges/releases/download/v2026.03.28.2/edges-2026.03.28.2-aarch64.tar.gz"
    sha256 "543b218be1b643d0408b5347778c43481c8a261c045c4fd96fbb496f944627f4"
  end

  on_intel do
    url "https://github.com/pablopunk/edges/releases/download/v2026.03.28.2/edges-2026.03.28.2-x86_64.tar.gz"
    sha256 "d53006de7417589a1edeab7d0a7d7d7265be198913286ae44082b09d9c1a37f1"
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
