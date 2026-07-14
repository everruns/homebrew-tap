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
      url "https://github.com/everruns/yolop/releases/download/v0.8.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "8b749d5c8ded61d49f1a0a5d4a73971d02e7826e48e1a589979f4884e9ac261b"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.8.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "ecb508337b8a148a22b0a79d693e6a8fa32e2bdf401ae67429214fb6ad7253db"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.8.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "38dc756a9b40e5e8e7f0e97151ff258f189190b6fb91e3b198f71a050551b7e8"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
