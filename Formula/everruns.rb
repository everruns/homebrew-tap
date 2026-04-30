# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.23/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "49e9a6aae75caeaed242eba793440b85c75f6974d817e7a49e0a89e7e9d90257"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.23/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "5b5370b7cddcaa50a2c0f216bf2e2f6ffff90368f7bcfd6b558bad37b11114b8"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.23/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee685591650aab691b45217eb55172e29d18a9220d21065bcc18f9a2f64f151c"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
