# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.31.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "ab95fc39cceeda7b9081af67fbbcd7630ffdd0ddbe1e9ce437e9d8dffa724bc3"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.31.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "fef7fd72b0a0c62341102797c06fbb4d77d88118f4ab0941abb596b68eb1ee2e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.31.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "758a43306004734f18b5fb5f54e7984cf850cb9c2f0112681c31119236b5b258"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
