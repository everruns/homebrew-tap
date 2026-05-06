# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.5.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "1327a3dc4e5f949d6de6279a6e62e89df5744c348e1fae67a556c09ac60dccf0"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.5.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "877f970e85ab330ec896d367f30a97f6d625f32c30d570c1f3b438d8b0b06eb9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.5.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9838b0d5f86c9457dd7d45aff9adbad040a0942f312f9b42da1e561d4313e445"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
