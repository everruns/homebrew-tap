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
      url "https://github.com/everruns/yolop/releases/download/v0.24.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "e58873be5b4d28b708fb9bb9ed64a232ca1dc438f32197599702f8a0adf11c37"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.24.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "168f5e405a70534b67b03787c1ea248e539e4665771e9f294ec225087ba966ee"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.24.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c0121b90b4800d897cf95060c5679f5c9e9930d334980e33717790f6c3388e04"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
