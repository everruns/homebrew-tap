# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.37/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d8158828b3348a7bf5b38b7da3885f1d72d7c4635376124c636a54535c5541ff"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.37/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "52af70c0b802331e0af52facdc45472b2f0a7fdbadf1900428f0f9964d56f7f9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.37/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e3c8575cc290532aa8884503768afc01e36f0596605bcf93cb462e79557f54b"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
