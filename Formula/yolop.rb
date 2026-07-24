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
      url "https://github.com/everruns/yolop/releases/download/v0.12.1/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "77421e12b6fe5e52c1e138f7e58ac1da9503603cc58b8595950b138ede9c2f2a"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.12.1/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "6a7f73ec2a24b0fb10093ef2dbd4d4fd3c8ed3dc42659231d92344dbd743d812"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.12.1/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f4bc27583faf602b161bb91a045ec516805a86683b530ce272bdea964d41e6dc"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
