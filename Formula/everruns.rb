# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d3bab10777b732aebb2d208007c298b165cecde085b68bb8cf17cb3efb0910d8"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "fa44c975b48da7e0230628cbd005468b9112120cce064214207f0f03dd01ac00"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ce7f6bd32544cc71097fce533e736e29662e17e457cacd459ace2dc46063dd0"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
