# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.26/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "74ca5ce1a6098ed4eb539aae507a7a7599490481535e544d83b725432da08e3c"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.26/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "e7eb2b8234a00ac534106377c3a5947bfbe83265260652bab4ec8ea25e5f4af7"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.26/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77d4e39adb3eb4fdac22f232d6813a7dac30af4d2b28ff513fe7d013964f69d2"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
