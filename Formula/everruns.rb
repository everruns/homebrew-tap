# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.48.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "85b77e2011273f9da0bf75c35cd466193a3ab0dc788e068b1deffc26fb01a431"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.48.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "e80d1929676c9d3202dcc828bb419cc86252832e558bc5bba78b4d6f5335db9e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.48.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf3760a24adb367b65eb61f924f3a0198ece8de4268ca6810818e56e1a412704"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
