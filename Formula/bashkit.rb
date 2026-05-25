# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.7.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "0d6967567caea18ffc89ceb1a6d8d9baef678dd73467611f5c26498955fa9fcd"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.7.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "38a69fdc91007d63056dbce2b6120df4e59d77e7c8e80bee76700dfb1849eed2"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.7.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0ce9335988184dfc483471193088095518fa7a07735b58ff8d842cb2c82b660a"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
