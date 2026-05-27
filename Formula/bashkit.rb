# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.7.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.7.2/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "b1c3d91bfb4915e95664c37beb01d1ec948828b5261f1e72d005cf5b87ecf1cc"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.7.2/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "48962c4b3c1b8f3edde92193725e2b1d3932392dd48c56acad91f6dd9de9628d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.7.2/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "471ab13fc5a3a58fd733c1d64ef18679428b98a946beffcb8107856cc416027f"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
