# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.8/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "a1f94fdec8c5d826d22c3171e7e4130b2a3b5973cf5c681e10f571433702cdd6"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.8/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "e24eb018fad1ddedd15c8ed422ea357d59ec76399b28b827595edc0b85fababa"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.8/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8313c16d8c3259f13f22d5e41a7d83c75346e09d95f84c2d05b564d0c3fc24f1"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
