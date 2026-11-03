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
      url "https://github.com/everruns/yolop/releases/download/v0.23.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "816b9619f96c396c5d5ad06135ba7e6d83cfd1201a32fafae101f36033c96401"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.23.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "47813f1a42ed00dc701b37687fb24a0fd9cb922043b566219d6bf62577f2c35b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.23.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d440b46b04a99ff748ee748fd75b690bac4ca3e40f3900a1f7133b9edc8f1fa2"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
