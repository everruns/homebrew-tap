# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.2/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "0972e93d30a5b3bae34754205befb0a19451d7d24667bc434406df7560a1ef02"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.2/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "3788f75524dc2f896b2e8902208e8e3253023c97ed90ae8224099f05e91bbe3d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.2/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cedcef54184d8cd05a312ed4025316c77621da8a2e68d0992ac701582b986dcc"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
