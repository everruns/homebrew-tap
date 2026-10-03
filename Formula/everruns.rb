# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.36.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "385511450e30651d67d9000e3422d323aee3e161fe55b12967ef3ed864af322d"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.36.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "bfb71a907c6ab3dededcfccdfba8370eb4a01aa4cd19ff14eaf9aa38fe1c10a8"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.36.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "623d9bff7d79d60e02c0085643c400a5d0f39cd634f95bddba966d5c2ca2eab4"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
