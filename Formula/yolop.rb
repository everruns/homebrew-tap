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
      url "https://github.com/everruns/yolop/releases/download/v0.15.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "91e65e37c9b2fb2d3a7034931c0182e4d19367c55197d3716c3b28a9288b2cd8"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.15.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "ad1d8680cb2acf20ca0ead1fd604d64a0142dd3e31fa1ea2b65187a2dfe8591a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.15.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "efd731334de63748b7b32880c1fb6da3ed214029ceb316c228b3a27e2e068a5e"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
