# Homebrew formula for bashlings (prebuilt binaries; no Rust toolchain needed).
# After a release, update the version in each url and each sha256 from the release's
# `<asset>.sha256` files.
class Bashlings < Formula
  desc "Rustlings-style interactive Bash exercises (Uzbek)"
  homepage "https://github.com/qobulovasror/bashlings"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qobulovasror/bashlings/releases/download/v0.1.2/bashlings-aarch64-apple-darwin.tar.gz"
      sha256 "9694b416e0cb7ec337d3b0d15eca01200d342309104d779e99a644fbf7cdfdd1"
    end
    on_intel do
      url "https://github.com/qobulovasror/bashlings/releases/download/v0.1.2/bashlings-x86_64-apple-darwin.tar.gz"
      sha256 "5fffa1c21da261f2a51fe620c41d38e8519eb5fc21316bd01395a97b4be5027c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qobulovasror/bashlings/releases/download/v0.1.2/bashlings-aarch64-unknown-linux-musl.tar.gz"
      sha256 "19531fc48e8fb92f52fd861be8ae89dff375fd065f5ef6e87d29294f2358598b"
    end
    on_intel do
      url "https://github.com/qobulovasror/bashlings/releases/download/v0.1.2/bashlings-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ed2c957354295967020526bc21c63e33602b0c3597182013258454c1f7c020c7"
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
