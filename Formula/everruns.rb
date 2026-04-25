# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.21/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "0c4cbd2bee16e831d80bb6763f565d118ec441a8c9e28aeb8022b8a89034cba4"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.21/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "f5ac9d9d73523506a498cb85846ea211ab4862702d5b2ebb20cdf650560bc841"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.21/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c339cbcd010e02458188caaef2c95196e23a244ebae6259d5bcfd6629c051f6"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
