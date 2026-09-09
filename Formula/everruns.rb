# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.24.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "29ad9c58bae7d6ecd05ab0d87a19e6873b8d22289b95f4bd31b7773695553e42"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.24.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "0d1b69ebde66ebe08ced374675f3c641b4a0ec436698a08a2cb1d4911583c340"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.24.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "015774440c482981f3926652cfb640d65da110e0efadcc66e80e7a80340192dd"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
