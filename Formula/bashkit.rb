# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.1.20"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.1.20/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "0c55434906ad521ec3ac10ee0c487efc3727ab68a7255cfc6828eb2c2a62fdd9"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.1.20/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "b4bdeb77c1a0f5a583e95f817662f81579231d04e56bea0bb4f7f80a29dea330"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.1.20/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7fcd75cfbd39bf04c027e36901de7b961f412e2130dcfada6f6e8028aa5c5b75"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
