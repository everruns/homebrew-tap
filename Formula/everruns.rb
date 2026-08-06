# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.21/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "a39034f2c8fcdac5db832697a3370cf57a61b8c45cbc65bfcdd8dce1b564e1a8"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.21/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "ac0b46f886c0a7698439cf6a1171c604f77e2200f7dd98fb00d558be503729ed"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.21/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f0af7c351ba0aa5381ea156812a0bc7a5b0eb425221fa5e58fc75077be9c297"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
