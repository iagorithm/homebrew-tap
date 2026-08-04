cask "worqer-cli" do
  version "0.1.0"

  on_arm do
    sha256 "d9f295534e01eeeae4007ac5d67edb767593baa2667e52a2fa2a1cac7ad1d946"
    url "https://github.com/iagorithm/homebrew-tap/releases/download/v0.1.0/worqer-cli_0.1.0_darwin_arm64.tar.gz",
        verified: "github.com/iagorithm/homebrew-tap/"
  end

  on_intel do
    sha256 "e47d46f0f3da036dd092b7c1239932166737e1381a5d7cafc0ba620512ca15ae"
    url "https://github.com/iagorithm/homebrew-tap/releases/download/v0.1.0/worqer-cli_0.1.0_darwin_amd64.tar.gz",
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
