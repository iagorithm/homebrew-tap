cask "worqer-cli" do
  version "0.1.9"

  on_arm do
    sha256 "046fde0a1ee40ba393c944cde5a160fddddb6b238b4950811b65544b54b409b5"
    url "https://github.com/iagorithm/homebrew-tap/releases/download/v0.1.9/worqer-cli_0.1.9_darwin_arm64.tar.gz",
        verified: "github.com/iagorithm/homebrew-tap/"
  end

  on_intel do
    sha256 "ab3af1437afb2f50a1cf1600ea4c3a8ee7840fb7b42bcb45771ae734661d767e"
    url "https://github.com/iagorithm/homebrew-tap/releases/download/v0.1.9/worqer-cli_0.1.9_darwin_amd64.tar.gz",
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
