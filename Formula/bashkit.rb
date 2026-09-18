# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.18.1/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "fbb8e1216c3d7524a9024a447ec93d27136d1d3fca6f2429f4eb7afbaec89d08"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.18.1/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "db8a0c5fab2f42ccdf04bf4cf26d7018634a067623d4911f251f680d13888bdb"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.18.1/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7c92b6ab86e674eae17eb72db65a387bc6337464fab5c70579af8f973caade0c"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
