# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.28.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "02b32db4b146b49cec9cf856f016b73c8de1114225a1e7a991615f6ff816f870"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.28.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "f59c93fc5e6faaaabf11e68ed4bf21ace310931f14df04c0ccbe47bca53958bc"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.28.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb44bcc59230e131c8841b706c402db76d848146268e86718e2ec3646fe53e6d"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
