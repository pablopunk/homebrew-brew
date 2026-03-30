class Edges < Formula
  desc "A lightweight window border tool for macOS"
  homepage "https://github.com/pablopunk/edges"
  license "MIT"
  version "2026.03.30.1"

  on_arm do
    url "https://github.com/pablopunk/edges/releases/download/v2026.03.30.1/edges-2026.03.30.1-aarch64.tar.gz"
    sha256 "cf0cffe1bbaff3fc76b62beafdfb4285c621b3635d44a4b3f361590b834531d0"
  end

  on_intel do
    url "https://github.com/pablopunk/edges/releases/download/v2026.03.30.1/edges-2026.03.30.1-x86_64.tar.gz"
    sha256 "018acc9152fc9608940fa5ef71da95c794ef7906db368badb17d2f0585aed226"
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
