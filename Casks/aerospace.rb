cask "aerospace" do
  version "0.20.3-pablo.4"
  sha256 "f85a54ffc30f57e001ffaa9585e7c42c16d2c0a7f8763df065a0e9a7aa6ddb96"

  url "https://github.com/pablopunk/AeroSpace/releases/download/v#{version}/AeroSpace-v#{version}.zip"
  name "AeroSpace"
  desc "An i3-like tiling window manager for macOS"
  homepage "https://github.com/pablopunk/AeroSpace"

  depends_on macos: ">= :ventura"

  app "AeroSpace-v#{version}/AeroSpace.app"
  binary "AeroSpace-v#{version}/bin/aerospace"

  binary "AeroSpace-v#{version}/shell-completion/zsh/_aerospace",
         target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_aerospace"
  binary "AeroSpace-v#{version}/shell-completion/bash/aerospace",
         target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/aerospace"
  binary "AeroSpace-v#{version}/shell-completion/fish/aerospace.fish",
         target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/aerospace.fish"

  Dir["#{staged_path}/AeroSpace-v#{version}/manpage/*"].each { |man| manpage man }
end
