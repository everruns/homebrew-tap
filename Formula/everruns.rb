# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.20/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "105842be40868e085d721e846eefcdf1afab5dced332b9366bb724ee43c6c504"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.20/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "c1839b8702780161a6064e53aa9c886641e185d9aedc065dca8e3ad7ad543ab4"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.20/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f90ca24bb5d14cafe0efc78f1719cd0707ac4cbbcad5b4a39c83974af189bccc"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
