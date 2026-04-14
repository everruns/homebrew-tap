# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.1.18"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.1.18/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "3ee4bcc6b3822645bef671a06b733fd48ce748958f2e76436edd1a2e4cda843f"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.1.18/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "a2b76e9c33fec6d2fb54baada6868643102bc99e05ec8960d549813be716d700"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.1.18/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "821946609cecd50993ceec22a8975ead7d920449ae844ac0e6cd24c236a5c731"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
