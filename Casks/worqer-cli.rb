cask "worqer-cli" do
  version "0.1.5"

  on_arm do
    sha256 "055b08c0b6998df61ecc565ddf97c3d4d25923b23b623bbb0736c92fbb9c2969"
    url "https://github.com/iagorithm/homebrew-tap/releases/download/v0.1.5/worqer-cli_0.1.5_darwin_arm64.tar.gz",
        verified: "github.com/iagorithm/homebrew-tap/"
  end

  on_intel do
    sha256 "9b6dc01f42e256e4d1b44e3ad463412cff4da23796a51e79b6d3293fd741b7a6"
    url "https://github.com/iagorithm/homebrew-tap/releases/download/v0.1.5/worqer-cli_0.1.5_darwin_amd64.tar.gz",
        verified: "github.com/iagorithm/homebrew-tap/"
  end

  name "Worqer CLI"
  desc "Operate the Worqer platform from a terminal"
  homepage "https://worqer.app/docs/cli"

  binary "worqer-cli"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/worqer-cli"]
  end

  zap trash: "~/.worqer/session.json"

  caveats <<~EOS
    Run `worqer-cli login` to sign in, then `worqer-cli status`.
  EOS
end
