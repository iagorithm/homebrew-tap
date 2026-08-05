cask "worqer-cli" do
  version "0.1.8"

  on_arm do
    sha256 "74243dfbcc59aaaa0a97072779a3e6a50c48054ab0ceaf181d248122a1bf4bdf"
    url "https://github.com/iagorithm/homebrew-tap/releases/download/v0.1.8/worqer-cli_0.1.8_darwin_arm64.tar.gz",
        verified: "github.com/iagorithm/homebrew-tap/"
  end

  on_intel do
    sha256 "9d05ef7e63ff077b4f1f6e90c0d1a3d09926fd825933718083f3998fde9202f5"
    url "https://github.com/iagorithm/homebrew-tap/releases/download/v0.1.8/worqer-cli_0.1.8_darwin_amd64.tar.gz",
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
