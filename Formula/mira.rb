# typed: false
# frozen_string_literal: true

class Mira < Formula
  desc "Rust-first, code-first evaluation framework for agents and tools"
  homepage "https://github.com/everruns/mira"
  # No explicit `version` — Homebrew scans it from the download URL
  # (the release tag in the path). Setting it again trips
  # `brew audit` with "version is redundant with version scanned
  # from URL".
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/mira/releases/download/v0.4.0/mira-aarch64-apple-darwin.tar.gz"
      sha256 "f1996099deb0eeb24c8c738f8fce924b1817fcb654baffc36c7d4b9cd422ca5f"
    else
      url "https://github.com/everruns/mira/releases/download/v0.4.0/mira-x86_64-apple-darwin.tar.gz"
      sha256 "b8a56e606254a3c721bd4c0a5cc1da92c5664c8cf2953e30c00c5ec26bd2f14c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/mira/releases/download/v0.4.0/mira-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "913dc4718d48a8e406a773f6a321eac2614b1c957c8bffd9abb5309e126df100"
  end

  def install
    bin.install "mira"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mira --version")
  end
end
