# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.1.21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.1.21/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "5f8c110fe39ee709bb9a4714e8d0748e3622f69a69241f4c68ced5bdfdeb3c33"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.1.21/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "e64664ba3b597fa4e6e6e99858475203386b4ba9a3b0b35cf69d030e0934cd08"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.1.21/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c52b0beb05d83174d86003001f6f2e307121b09aea633176eca545b060887e76"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
