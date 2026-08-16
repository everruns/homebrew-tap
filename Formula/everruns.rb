# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.18.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "e4a800ebdc20973a895adefb8761755daef3f84f2fc3b11f363a4a9bfb98a94e"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.18.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "38c7dc6a77283313746e58dc3db84d2cee0704e758c46ca11dc409a74ae7014c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.18.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d1ac0b160674726320b7e03f9949ac4a34a2ed80c5e9c21d53c1c3d4b0c126f"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
