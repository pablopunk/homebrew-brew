class Edges < Formula
  desc "A lightweight window border tool for macOS"
  homepage "https://github.com/pablopunk/edges"
  license "MIT"
  version "2026.03.29.1"

  on_arm do
    url "https://github.com/pablopunk/edges/releases/download/v2026.03.29.1/edges-2026.03.29.1-aarch64.tar.gz"
    sha256 "eba61162c779c00ecc4eb0d00a20a196cc5f03625533bc2bcc9ee1c516299745"
  end

  on_intel do
    url "https://github.com/pablopunk/edges/releases/download/v2026.03.29.1/edges-2026.03.29.1-x86_64.tar.gz"
    sha256 "b3c3ac83d6dcbddfa07dd98ab15f0207de68555e4976882a6d0784d1f60714f1"
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
