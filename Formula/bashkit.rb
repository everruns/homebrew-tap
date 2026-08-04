# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.15.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "fa51c9d948d07cac4ca8e01bcc0132dc826750d3df19f9a8ccc35c017f16ae98"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.15.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "eff8e72b51664a25d4e45c546ae3bb2521f48de9255f14a2a75ae7f8d0518bb1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.15.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "91c9cbed926fd842ab86001b99731675b3e7f62f6a9dd6c2e35f2146c15e1d65"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
