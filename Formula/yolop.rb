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
      url "https://github.com/everruns/yolop/releases/download/v0.23.2/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "e8094896c9166b5dbf482e17825c4866c5af00f577f53ee53151886890cc3b91"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.23.2/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "ed33458bf6d55099e0ce406baaaf92cdc530b67378faf6cf19b739d5c85a1752"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.23.2/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "20cf7b0bb79428e2720ba490c886e3cd368ccee8aa1579a6d56cbeb4f60c55d3"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
