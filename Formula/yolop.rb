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
      url "https://github.com/everruns/yolop/releases/download/v0.11.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "b6cb67f2989f634bc9a97e0ff4f70816bd4d638bbca65201704581a6ab3c35bf"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.11.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "bc9dbf9a910f90a5ed8fc4fe9bb9fc54d117389f51298925d964a26b42e3a563"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.11.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3539dd7218cc148ac47c2c2d49cbf599c1a5678ea730a0b3e82cde04a6add031"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
