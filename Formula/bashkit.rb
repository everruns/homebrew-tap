# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.22.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "7b9ba4e2c1407c5240e8063e6a4acec4df4fc609ffb68bbac68aa17b120efd9a"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.22.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "df63d6057b34df8ce5921e1376d49c5fa83a019a69f7c8af2523aeadcab1105c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.22.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "50db0826f0d9c4fd77d2c52ad48c0851dcc22c60f3ef50cbe578551128930924"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
