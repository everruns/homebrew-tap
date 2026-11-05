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
      url "https://github.com/everruns/yolop/releases/download/v0.23.1/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "5f05db004a728d0c72477c115179e9c676618916291a88f381dcbb0fadeea737"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.23.1/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "ac2bd32d03e53a95cab30dc6113ffb9c49ef6ca978868ad754a1d57d4a5d53c6"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.23.1/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fc265c5f4e8ba7a60b496d6c257e43b245a83ec448a07667b3367a88c0325e5c"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
