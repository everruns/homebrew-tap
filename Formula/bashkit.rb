# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.2.1/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "a85b6ba747a0faa4bf21d74582fd81cb60c5c339a100e6f2ea61e5ba129ff51b"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.2.1/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "f30be87876535524582a418a21a81c19d4e0d3f758d24974c992064d5fab77e8"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.2.1/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7ed84afc0b1e325d2c18dc37d495478162fae1028409518b7abe69393c2bcbfa"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
