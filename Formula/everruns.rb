# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.3/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "b890339d004489d0d41244105a80e6d08f90ebec814cadee734ed4a5f691e779"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.3/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "8b123b2d4a763e781f15e929d5db0743a98d9ef90fc6f807182f369c30ad2efa"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.3/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a28a94b1eb3cccdcc3975c515b2ec5ca242ef5b460d80572885830783b1712f9"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
