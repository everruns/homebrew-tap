# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.15.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "f5d1f18e9abdb62170845a70e6170d23c24f476933f859f12537b4e9ad776160"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.15.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "9c8a2d23feb096ce651bc3db0b7699614d42e48fa2f62a553bdf29cebba230eb"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.15.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a6a3aaa2f6718167707e8c77f16bc1caef0ea34cf06e5b005c7bdddbf48c311c"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
