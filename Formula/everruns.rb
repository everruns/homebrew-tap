# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.15/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "762a14e4a0650d16a3a419dd651cbc5770669527565e6a7ae0d4baf7de88b19d"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.15/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "f4138b0f085ba35a11b155b01b72f21346e2e34fd2c50a406a12eb6bbcd9b11a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.intel?
      url "https://github.com/everruns/everruns/releases/download/v0.8.15/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a6f402de55bfd1f81d4f760078bf89d6699eaaece111bb910b8002aaf78eeb63"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
