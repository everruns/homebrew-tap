# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.7/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "436b53e337494a87b3d97e2426df3c16abe75c6e7104c49d16364372131a277b"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.7/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "ee43d697037eb52361b458e69d7001d166022922f5da13ba1e430b29a3608efd"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.7/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c63160de1be6f2a97aea014927c9df0217f6153715e39c3c2cc27605d4c64e48"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
