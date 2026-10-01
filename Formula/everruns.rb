# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.33.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "81d7d74442d3912bf58588299c2b47c340bb9af1b797a9c47c85ae3a8d4c2cb8"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.33.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "476d291de882fe7a9e2b041462131ec805900ac969e26d9f3f1120dd5e9d70b8"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.33.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7463e196b047bcf563912c61d1cb40f20764268088d1702c479a3a9c40392602"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
