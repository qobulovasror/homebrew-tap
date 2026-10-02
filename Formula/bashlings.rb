# Homebrew formula for bashlings (prebuilt binaries; no Rust toolchain needed).
# After a release, update the version in each url and each sha256 from the release's
# `<asset>.sha256` files.
class Bashlings < Formula
  desc "Rustlings-style interactive Bash exercises (Uzbek)"
  homepage "https://github.com/qobulovasror/bashlings"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qobulovasror/bashlings/releases/download/v0.1.1/bashlings-aarch64-apple-darwin.tar.gz"
      sha256 "47216b79e96c4883c634e6465d881df687ddb2a6a1b03f5bbe3d1e6bed47523d"
    end
    on_intel do
      url "https://github.com/qobulovasror/bashlings/releases/download/v0.1.1/bashlings-x86_64-apple-darwin.tar.gz"
      sha256 "2cf141c66ab0b90666d080353be8fa9d896b0ef923151d8ff690f982919d53d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qobulovasror/bashlings/releases/download/v0.1.1/bashlings-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce058c548e392ae587f84ad5b6cff4c93e24338ac79c930e23b4a1cfcd74551d"
    end
    on_intel do
      url "https://github.com/qobulovasror/bashlings/releases/download/v0.1.1/bashlings-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7956018afb4a35dda76aff5e9fa12be879fac499b002908c4ae7c8cfbc79d3f9"
    end
  end

  def install
    bin.install "bashlings"
  end

  test do
    assert_match "bashlings #{version}", shell_output("#{bin}/bashlings --version")

    # Outside an exercises workspace the CLI exits with status 2.
    output = shell_output("#{bin}/bashlings list 2>&1", 2)
    assert_match "workspace topilmadi", output
  end
end
