# typed: false
# frozen_string_literal: true

class Yolop < Formula
  desc "Minimal terminal coding agent built on everruns-runtime"
  homepage "https://github.com/everruns/yolop"
  # No explicit  — Homebrew scans it from the download URL
  # (the release tag in the path). Setting it again trips
  #  with "version is redundant with version scanned
  # from URL".
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/yolop/releases/download/v0.5.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "2d16a3776e72e27cebef8abaf728020fee5fb2da6ddbded887857a8762387399"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.5.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "a2a36e50dbaccf5c3620ee6a07b55b6a0ae7d07c3e34d24d0b943574a47469f4"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.5.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1f977c0a162b0f861c277d658a0afe892c14df552a87c191e2d0f821d47d01d3"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
