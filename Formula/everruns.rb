# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.27.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "b70941ca4aa7f2c31aed87e85896c3e541caf5be55f25d320e1c7338ef06e371"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.27.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "b8b3fb691c5c0236d96bf9963bfd61121825047fc565383ff7e36a4f452157a0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.27.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a91bb0cf98d9e136e6a00e2f0497920d37fa9c295f7e3e8ea9c84e6a06545ad"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
