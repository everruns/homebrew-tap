# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.15/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "22f10c8c74e04e9a8b3cc33fee545ab0252d48735eb982078562270ebbe1f857"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.15/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "ef35f875d13a29050478870ca7d8d21c9f3bb9dead9ebf8dd7ba6b1540349f71"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.15/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a65e0e7445fc88f8370d1d0ff6f3eaae7a7d148e033d462f040dea675b7cb68e"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
