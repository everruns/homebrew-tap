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
      url "https://github.com/everruns/mira/releases/download/v0.1.0/mira-aarch64-apple-darwin.tar.gz"
      sha256 "47589de918a5a920f60a443ae6314a6e22de0dfa602c51e9129617103b70ae99"
    else
      url "https://github.com/everruns/mira/releases/download/v0.1.0/mira-x86_64-apple-darwin.tar.gz"
      sha256 "af14d5fa3f46b595aa17c0712fc0258c15ccee006114f6cf50b997752a833043"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/mira/releases/download/v0.1.0/mira-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "64c0aff85ca2e38f07f262b89f838ecda1cbd75fb942232479487e5139a4deae"
  end

  def install
    bin.install "mira"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mira --version")
  end
end
