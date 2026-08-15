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
      url "https://github.com/everruns/yolop/releases/download/v0.15.1/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "60fdf58f901f79043b0170f47e45a685a1259a9482f91d747538505d9cb6d311"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.15.1/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "13c47f312d2716304ea32d9ee52584138be51f329e38f77a5ef703702565989d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.15.1/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "413ad75f3ca51aec7cf0a78656d45a064de2842e4fe9fe4176f76f50b59a4883"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
