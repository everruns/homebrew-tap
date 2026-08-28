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
      url "https://github.com/everruns/yolop/releases/download/v0.17.1/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "f2053da8982538fc636d8af7f6aaf7027b5eea54215efad528bc48eef6a0bb6b"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.17.1/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "7b1af7e59be984d9ecf2e0b46b02a603688603d739e033d659bcd204ac277caf"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.17.1/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0057692cf4a1801d4a75340dbb72ee8c2b0de87ff407e7f5efb303e86da1ad2e"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
