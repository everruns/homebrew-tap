# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.14/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d4b692243f8267676b938ca45864c9e64d12527bc2f90e935e0b5503e53f5714"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.14/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "d4cd962d7d297baad26ea4c85f59a28fc1da38fb37b543406ee357c0610039bf"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.14/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "632415a974d58bca4796e14afe1172eaa5fa25edc8094394f1e466e4d8242012"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
