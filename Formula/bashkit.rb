# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.21.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "088995d26c626ef0b8a5d6db22e02a679b453e8ba05d1592a491c09bdab778eb"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.21.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "f5f914b5522d47b6f1205a2d851c2e7e9fa49e3f495f13579422cbcf25f9a1ca"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.21.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0687954d378d5ef9ec4d69422a64117110246297361b7f1b61bb97ab96d0bacb"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
