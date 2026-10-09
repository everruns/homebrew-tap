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
      url "https://github.com/everruns/yolop/releases/download/v0.20.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "ac4ac51a810be676d53f23a838904d09b6bc9cf7ded5b1b7e272dd94218f720b"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.20.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "8d096d108c435628529f1f987ca0a7d351df3fca6734a7f1230abf9b722267c9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.20.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2527b0a35e1d77952ae048effaf42b787516cdb5280c9cc764e2a2a4701fda9c"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
