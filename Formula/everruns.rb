# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.19/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "1a0e44aa28f16e20eea2f765100c5a3731de245689b10e0ae293a5352271c1bf"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.19/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "d0f9654904aedeb1cd857dc4c1955df61e2ae3383c98f0b9c9822ceb4d790749"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.19/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7273ca3e65c9800d81aa744be42b78b90a9d2bd9a6f47aec728ef30a712ea20"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
