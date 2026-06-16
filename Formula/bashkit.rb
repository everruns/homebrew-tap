# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.11.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "abb3c729a284c17c43232a7ae0f4c99a8918af305f683955a81a161621968149"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.11.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "ff96f439f2d9059d591b2e32e83c91f23ced2b9002851404d4e1b7d3a461e16a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.11.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2e0d65361ba8fa6931effb3ec4b63282f2176df73cff0612fc749360d8a25de3"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
