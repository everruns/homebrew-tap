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
      url "https://github.com/everruns/yolop/releases/download/v0.23.3/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "c5e04a4862784817a6cd058ec1af810d49443b0714e982fe98de636a57f96c52"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.23.3/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "83e5de59e6adc8884f28c308dbeedef51938d815641eefdc86963095dcaafaff"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.23.3/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "faab50eeb56c9d9fa832b7e0cfba6ca0b7ca6244cfd39036359ecc7e0586c7fd"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
