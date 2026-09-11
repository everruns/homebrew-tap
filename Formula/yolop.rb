# typed: false
# frozen_string_literal: true

class Yolop < Formula
  desc "Minimal terminal coding agent built on everruns-host"
  homepage "https://github.com/everruns/yolop"
  # No explicit  — Homebrew scans it from the download URL
  # (the release tag in the path). Setting it again trips
  #  with "version is redundant with version scanned
  # from URL".
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/yolop/releases/download/v0.18.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "c08ceeaae5e40c68d9bcc9d54331ebc4a13262f8870bb793ca40f6a7c8a1e70b"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.18.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "6c1733a5b46a0e59ab7d15daaedf3e2b86bbd92c885241aa27e74560fab8c216"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.18.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "39a71dd0c21df700687551230304629d6309917cb5802c80d093c1be31a27e73"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
