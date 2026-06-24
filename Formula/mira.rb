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
      url "https://github.com/everruns/mira/releases/download/v0.2.0/mira-aarch64-apple-darwin.tar.gz"
      sha256 "5dcbeb5c4ce599254bf1e1bf341bcee298eb0aed2910dc51e0ebfa6476fe007e"
    else
      url "https://github.com/everruns/mira/releases/download/v0.2.0/mira-x86_64-apple-darwin.tar.gz"
      sha256 "877583545fd13a53ea716e7c9a0ac1aee6721189413819a48e6a56cfec1c3303"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/mira/releases/download/v0.2.0/mira-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f353c78e3ea8b38deae4b3133f6f6c5dba4c4a470a0442c51ba071c56daca6a5"
  end

  def install
    bin.install "mira"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mira --version")
  end
end
