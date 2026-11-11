# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.52.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "b40ef72b211b47595fbc9264ebd0b33793e0a89b652f2e8a5f947c67e8f2860a"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.52.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "4ad39440ec176fe3b1c5bdc4b92d03d2cf28cc4927c2b98616ad88da9e9e7cbb"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.52.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd810806ab2c127593c57848e73b43f2f2bdab24b8c80ad4e939c2e317a348dc"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
