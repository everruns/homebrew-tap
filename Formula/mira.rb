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
      url "https://github.com/everruns/mira/releases/download/v0.3.0/mira-aarch64-apple-darwin.tar.gz"
      sha256 "1d29c844dcf270b81f8ffa069d1dcc04c685b27ea678c81e642e4e6b590a3c94"
    else
      url "https://github.com/everruns/mira/releases/download/v0.3.0/mira-x86_64-apple-darwin.tar.gz"
      sha256 "aa28f5ede90d8f292abc6c243d55f3bb0ac2798cfe5c9f6d1da90bf391eef51c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/mira/releases/download/v0.3.0/mira-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "038ea8ed9ecd03e2ec451259822d5b4a7efd7c3b5366ea869b89e5e8007df203"
  end

  def install
    bin.install "mira"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mira --version")
  end
end
