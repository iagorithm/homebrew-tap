cask "worqer-cli" do
  version "0.1.7"

  on_arm do
    sha256 "108868380eae2eeb9a43f9fbd2b48a2968b38eabfe6427c02089aea7af25f942"
    url "https://github.com/iagorithm/homebrew-tap/releases/download/v0.1.7/worqer-cli_0.1.7_darwin_arm64.tar.gz",
        verified: "github.com/iagorithm/homebrew-tap/"
  end

  on_intel do
    sha256 "3024a7cc2b95621a8b6ef66b315a80956b1b4b5a94d2f1a23a09e2b842524e7b"
    url "https://github.com/iagorithm/homebrew-tap/releases/download/v0.1.7/worqer-cli_0.1.7_darwin_amd64.tar.gz",
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
