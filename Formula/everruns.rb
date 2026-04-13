# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.11/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "1383c59689925a7dfb9d98261ea469c094b4e2289fc0901377e6617f46efa92d"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.11/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "8e54f367f4bd1831c9d14105932087233291f7b2447dd90dbf9db564dc798568"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.intel?
      url "https://github.com/everruns/everruns/releases/download/v0.8.11/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0dc2a636e73468aae54c51f68d0c8ea650b23aacf860f8a5e0dc7a409ddc2a19"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
