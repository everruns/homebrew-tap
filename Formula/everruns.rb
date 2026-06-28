# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.1/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "fb197c064b15e050cab1c5462105a0d31df712e9bea91bfa2642ac13e44a9aae"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.1/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "7f8d7c825946770f079b3c758d79c8708553614d98083c9947785c1d92077e3c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.1/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea940a5e0a333f48c2d61828f041a2981634b2f9721824297532f54c8ab002eb"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
