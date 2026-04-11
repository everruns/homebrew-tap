# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.10/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "228116e5a1e102142395b0065e7d00168e91a0ccd998b95cf9e0b803f5a839f7"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.10/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "391640cb02e26ccf8781e277210029f2cca95a59c5b799688e5c9c94356b6a8b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.intel?
      url "https://github.com/everruns/everruns/releases/download/v0.8.10/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03203f75f00694d6162d58d5bfe9419f6c52edc0b338cbccd8ffe42d1c340add"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
