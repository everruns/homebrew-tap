# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.20/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "5ea4aff8b3ed9b82f6420998e01e6cae21c4cdfd28dbeee1d4fda1b16785da7c"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.20/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "7eb7cce804646f96da7bf60b2fbfe0d39057e20599c030b92614c14a9000ae97"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.20/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe9bdcd3bda8527cdfb8b8f291157e91a771de318f8c38ae494a870ef1f578ce"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
