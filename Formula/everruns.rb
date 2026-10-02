# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.34.1/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d583c14e60e5e4f15f26d9f3bb7b2618fb72baedb81ddf5db5c899f25a9e900f"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.34.1/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "25dad35e16d57fcfd20325cc15ebcfebc94f13eb04907e8c27c0956d2f105773"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.34.1/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8cf2e3ca72c9addaca2dd371a15f1c7b1ae6a07ddfe4d5098e576dd67148402a"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
