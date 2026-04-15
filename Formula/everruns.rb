# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.12/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "354f9aefc02e33301132b68d9cd9293f92cd983c0a4b6be62e7c01861540bb7b"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.12/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "8f1fd78ab675b8f4ae74f64e2665025d367eda499d64940b670d04ce9286bd38"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.intel?
      url "https://github.com/everruns/everruns/releases/download/v0.8.12/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc844fda52df72b2e1a2eacf578015e85b5f773beff7d1b3a2b6d80afe26b718"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
