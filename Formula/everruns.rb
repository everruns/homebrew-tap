# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.41.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "4336fb433708cb361023ee8cb30984a8955acdd165910c6ff7a8eeecbc8e1243"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.41.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "8127cc94027964edae77705e55e9620ed4b93ad685aa40dd951e80c4451a35b1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.41.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "24f759c53c00fd7b38c37452fa7d1e3ab7afe0c62ec9cb817efb347267becd86"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
