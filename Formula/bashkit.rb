# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.7.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.7.1/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "8d14ef9eaf3b7add2f0ee50fcf29ac0f6e18ce0ef881a5a24c7c6cda6e3089ef"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.7.1/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "c148bd764beec3e22e97fee433a04d129b12a678c6432a75de87fcecce170d0d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.7.1/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ec2f7646f0b4e196ab617c088cff635825cdc8f9086d8d9528811bd57cdea50a"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
