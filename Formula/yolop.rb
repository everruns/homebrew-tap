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
      url "https://github.com/everruns/yolop/releases/download/v0.9.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "39d6c3fc471491819c2540af4b8862b2a6b432621f4019c9d68736a4cb0a368e"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.9.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "15e51c935cab9c15ccfad20d425e6d46159a370aa87a9911838ad191eb95a5e2"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.9.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d92f47dbca3b80614c74361d32f4a6f67005578e85385b8bc23d4929dc6872a0"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
