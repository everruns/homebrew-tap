# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.19.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "6c2e6a414b267d9993f0068bceef63bd8273b512a41fcd76a9d568a56e8b2cfe"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.19.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "6800e2fa499075bdcaa7c5263eb3afb0eacbfe1c2fdcb52bfb04a6738876a048"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.19.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "82dfd36652fd496d3c75bc62dcdec9b9855315731a72c4a2941c29435abbbb60"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
