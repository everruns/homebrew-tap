# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.20.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "5994ec70e6e0e38af9107037707b621335767d556f04bf519819a7c9a09df417"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.20.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "406fd1ae60c8b233a37248b79a0e9cb489a38ea970dff1d72e0b43f8ee3e388e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.20.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c51a8cbf425714441d50ca6155726c7a84321dcbc7924ab5664cb7303aad5a33"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
