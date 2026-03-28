class Edges < Formula
  desc "A lightweight window border tool for macOS"
  homepage "https://github.com/pablopunk/edges"
  license "MIT"
  version "2026.03.28.4"

  on_arm do
    url "https://github.com/pablopunk/edges/releases/download/v2026.03.28.4/edges-2026.03.28.4-aarch64.tar.gz"
    sha256 "df843f799a7f6709b8dd0def4e398f7636690ce364ea4538f1413546b8c738b7"
  end

  on_intel do
    url "https://github.com/pablopunk/edges/releases/download/v2026.03.28.4/edges-2026.03.28.4-x86_64.tar.gz"
    sha256 "99ea4200671af680b5116d050e132eb1b026d44a16afab3523887df3469f9c72"
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
