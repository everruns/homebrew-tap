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
      url "https://github.com/everruns/mira/releases/download/v0.5.0/mira-aarch64-apple-darwin.tar.gz"
      sha256 "e0477de7fe815117da6fa5936cc381c7d747d0a795aed296719c1acf137889dd"
    else
      url "https://github.com/everruns/mira/releases/download/v0.5.0/mira-x86_64-apple-darwin.tar.gz"
      sha256 "e2089c810e06dc078cf88ced9ea1dd88071cb117d65b763ab6c9552c8dee354a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/mira/releases/download/v0.5.0/mira-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b69d1a9af34d83aae87aad2453cf642739de9e0859e043b2b6571839ef7462fc"
  end

  def install
    bin.install "mira"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mira --version")
  end
end
