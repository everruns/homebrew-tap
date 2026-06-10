# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.10.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d152cba27726361c92852df37cda15d0551614532855dde38916f3da00ac8811"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.10.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "8e30ad446715eb8a2efcb7f4b9ebb5001558b7b739cf8d5db83bc7922fb78d31"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.10.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9f75d3fe0aab5cafcc4085640e187b00753adc633c707ff4cdfa5dbd55ab645"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
