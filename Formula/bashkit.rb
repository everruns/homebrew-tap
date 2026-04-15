# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.1.19"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.1.19/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "df044c0daf4aaf45ab2c9405d18e9c0437c949491ee5e2c3dadbb0aaabf97e47"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.1.19/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "c64eb0929db03438aa94004a4fffb0ff21a44ab863ed974d9de7f5417b096384"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.1.19/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "638575aa7bfdf1cfbdc14d50827f5919f266de7166ec58ebe9c990226039db24"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
