# typed: false
# frozen_string_literal: true

class Yolop < Formula
  desc "Minimal terminal coding agent built on everruns-core"
  homepage "https://github.com/everruns/yolop"
  # No explicit  — Homebrew scans it from the download URL
  # (the release tag in the path). Setting it again trips
  #  with "version is redundant with version scanned
  # from URL".
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/yolop/releases/download/v0.21.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "a16b98c6c12c33a7e9f6323109103ce244008cd3ab10aa63f336975ea56e23d6"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.21.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "09fbf95c3e2c5f9543e73652b8f74ca3f1d3c27e40af057894af25050bfced4e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.21.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f786c2f415c333b7a7885408e4f5234825659e683b9fe1705443611b94011859"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
