# typed: false
# frozen_string_literal: true

class Yolop < Formula
  desc "Minimal terminal coding agent built on everruns-runtime"
  homepage "https://github.com/everruns/yolop"
  # No explicit  — Homebrew scans it from the download URL
  # (the release tag in the path). Setting it again trips
  #  with "version is redundant with version scanned
  # from URL".
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/yolop/releases/download/v0.4.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "dfd0e7aa4c559e515181d59401b3156733e7aadb5bb4be8dd37c92d37f9bb415"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.4.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "b26dab2d0a298e924bd4fea2451a3c12d9c818b3a3e04b844af5c43a6f54d95d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.4.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f1d6a82dc191e17e60915f0fafaf52ade0d43b1641ea278806d2e0b4cb03bafc"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
