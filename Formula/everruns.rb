# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.32.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "f16a61ea1cddbcfc914bf923f106c1ffcd55ea8dd14c0806a29226dd01c81c1b"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.32.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "75109a65cb120e16c04604ff0b11558a1c64e05da1cd86777fb7cf661c209919"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.32.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73e0cd349c20201181dd94ec293f72b10728998b1a0042b526d58c8e9b6e807c"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
