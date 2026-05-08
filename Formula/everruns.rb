# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.29/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "21b31d2c02f3550cebea9f75018afab3b1447e08c1e5e3fd19f688da6ebf2d84"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.29/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "9bd94fe0271a682491e04941c2cf7c8f59a7502a58b81c7de4000dd14500c430"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.29/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f27ddbd2fc739257b231ef0da228a460cd8ee8e4a7a5ee19ee69353cfe108de"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
