# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.18.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "6440f64826b7a68f4eeeb62911721274d4de10e27dfd872caad03e55f37fb891"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.18.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "2427accccdceaf248ddf169b70d3614387314c60b2953195d789b605bf5b2c42"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.18.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "190c2a7a90d8d2185fe67f31806dc41cc0ebccdb517d1596ab69342f2c659b9c"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
