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
      url "https://github.com/everruns/yolop/releases/download/v0.16.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "8c70e866386fdf9ab9fd03b21fb12cad014877e2bb76f11ec8cb7e0f07d106cc"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.16.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "6b49fa63ebe4ff0181a818b4c535ff9dc80b75ae22e7509205fde9f5778f865b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.16.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a4a6f655254e6a13be2f687d197071869e2a10a8cba964e661d4d769f525b4d0"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
