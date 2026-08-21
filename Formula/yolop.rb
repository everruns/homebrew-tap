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
      url "https://github.com/everruns/yolop/releases/download/v0.17.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "fd5503c5603333daa6cf15b6e4011dbb9f7100985bf8b2b8edbf0049c3415138"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.17.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "8aa847c1a42674d93dc9e3423661842fa9c25227e5807937bf2062a49654844b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.17.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3421e1fdadb8a1d3f48446cf7b8806273476e3f91f33cec1dfaefa4a09296ccf"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
