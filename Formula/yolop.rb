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
      url "https://github.com/everruns/yolop/releases/download/v0.13.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "428774dc7c4e23f939b3810169cfdeceda2547fc10596cd2d089d6a46e11e33f"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.13.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "604c5f74ea1cde4df03b7bd55efb1b014ab83e93b63cce530577a1ddb9617b6b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.13.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "668a29771fc05e2f9c7d00cda6a93d38fd4085db6d79d6b0c5652bd2094250c5"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
