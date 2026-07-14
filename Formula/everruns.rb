# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.9/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d10ee883cc162d0ed4e3613bde399c7048cbf90448bb2acdbe85ab394509f17a"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.9/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "929e67b0de1d31467abbab7fba7fa8367a22ae17aafb12ab6ef0e5602c44414f"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.9/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f63f21fa9f14bd89cb31dca96c413823ed70f8ed93a0411b8c5d6729a7e7378a"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
