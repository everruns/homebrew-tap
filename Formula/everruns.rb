# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.18/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "0860db7cee381be813389ade25848e0de45d09587a651fa3b57a84785aa05c02"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.18/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "9a0a93dfd870175dc13268a8cf61fce350e8d419357132bb1cd31a2d166b794b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.intel?
      url "https://github.com/everruns/everruns/releases/download/v0.8.18/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "831b5ea879103e3a597036082cdc0cfadd265bd1145b9fabf1417ee1c93bd3ad"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
