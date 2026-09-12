# typed: false
# frozen_string_literal: true

class Yolop < Formula
  desc "Minimal terminal coding agent built on everruns-host"
  homepage "https://github.com/everruns/yolop"
  # No explicit  — Homebrew scans it from the download URL
  # (the release tag in the path). Setting it again trips
  #  with "version is redundant with version scanned
  # from URL".
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/yolop/releases/download/v0.18.1/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "a5a7c9e97c4ecc36e363b9632f3c8454ea0a870e2c5117af13a5978dadfc9965"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.18.1/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "34a7036679f3a6482dad84b55fb66dba0ea06500c20ae5e583627d6f751e6283"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.18.1/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b9b55715a93c19a3531d4a60e4083fb7e46ddac7a996d9dd47532566cb2fe61b"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
