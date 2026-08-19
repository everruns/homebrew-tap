# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.20.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "236e10e063f83d978628140997495e6fcc1a263579392cdb82ff4ace054f4792"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.20.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "dcc2e35905fa74ffb8ee4e6d931657f5f7b06facf2f5973118cacdffd003e7be"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.20.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b801edb2cde744d98e7ff36a821d908241d13a07332b7a7ca4c960fae82143a4"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
