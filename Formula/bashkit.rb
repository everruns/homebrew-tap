# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.14.4/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "93c4e42bf28b863db8ac862a5686d41157c1dabb9b4cb2a89f137e4b5e4f3d22"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.14.4/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "68a662c82a85f343f73d905e43599ed7f429ddf0ec0228221b4ed97f9411e306"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.14.4/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "45276889ef10fb109bd5e752f65bce4b4a9bfcb0e433cf82be0854b6e2c3e734"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
