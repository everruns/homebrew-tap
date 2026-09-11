# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.25.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d6b8f9637c859adc95d6c95823941d5c2ffb9bbf3b8fa7f7d0c547187896b99e"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.25.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "9e6cda11a15a62334bb31188542f9a1de19f7b78867daf2f5f9ff12ab34752c7"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.25.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebb0e7669227b4e7eabfe2171fcc641d5a5de144f56642a45db88a43fb3ede72"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
