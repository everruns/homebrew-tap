# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.26.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "0e5ab859f799b7c333bcbf7268a89c2f793ef0b7015fc77f67e8ad8cd8511f95"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.26.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "44d9d64432e5d11c1e2d3eec56bb8c37bf6daa148cb6da7b1ddf7a6ad81247cb"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.26.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fc368cdad39838b9f1856a48a04f93d98e06cc540ad879ec0f016ddb0ac0a2d"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
