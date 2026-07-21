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
      url "https://github.com/everruns/yolop/releases/download/v0.10.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "b06599aeaaeb151f278cf0a00d342679cad2c53d78c28c57985016c8d5679f8e"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.10.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "9019d45d9ad4cb621cb078b0c199e4276ff3a2545c641bb6f21b88d3d2770642"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.10.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "176c3d4a5cc8aa6ba8f9a1de8a63b021185f02fbcadbbb3403ba033956cd15b1"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
