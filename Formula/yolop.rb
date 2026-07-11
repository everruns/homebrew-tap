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
      url "https://github.com/everruns/yolop/releases/download/v0.6.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "e9ce87052dee8d3760d4b6f10e0b8faa1aca35e2bd4c276134f40d69836e4a58"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.6.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "d6ddc17435dc8f6235e66a7cd2864b5f3f2fb0503b6d9990511eb16d55bc2f7d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.6.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a2ec421ab30fb5c02df4cc878096358f033996f17cc4d772fbb9acbeb8b0a751"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
