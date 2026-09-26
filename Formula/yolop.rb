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
      url "https://github.com/everruns/yolop/releases/download/v0.18.4/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "d71362eb0d233af7d8c101712d713aeaedc420c5a7d0a91da81a3d574b837a11"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.18.4/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "2293ef94dbe357c11360f670b781f1c07cde7ef28b77b69902ddb37b8eb4df33"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.18.4/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4c1f7bc60a0e2a1e84fca8394320af92f6142581ef2d2f859aaea54d436662be"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
