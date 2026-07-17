# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.12/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "ec4b1df4021eff47553d9bd99f70cf15ac1a459d2c4431374daf42f958f803e2"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.12/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "5d8c34f78134cd5360bb7ae51d19ff640a978b207e4ae7e08f7c726f9632e9b6"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.12/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac1438497758ee599b61c32e6c5fb4330f8fd47d72930c67368a78e2772c2854"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
