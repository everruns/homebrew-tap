# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.20.1/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "54de17316ec87418a07d7969b5e0db99855d11da5a01248451637a919424f1db"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.20.1/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "5caa0148cea2f580c0230f09f31b56616fe366e0da7609dd3a0086b67562beaf"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.20.1/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2b772634cb16a99caa0f1e8062724872db2a4af6ab16132d1682a371e42fb56c"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
