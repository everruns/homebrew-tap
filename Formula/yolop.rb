# typed: false
# frozen_string_literal: true

class Yolop < Formula
  desc "Minimal terminal coding agent built on everruns-core"
  homepage "https://github.com/everruns/yolop"
  # No explicit  — Homebrew scans it from the download URL
  # (the release tag in the path). Setting it again trips
  #  with "version is redundant with version scanned
  # from URL".
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/yolop/releases/download/v0.19.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "b75e9d98f7413a1d7dfdd273fd40e2192e6edeb9e597808cd06c1bd77141eb79"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.19.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "eb53ce39609d7af7e0ac2994c7a8f210c929d5736af853966cb4ee29bbfbfce9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.19.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ebc2618b16063ac2304e54c2613aff9a7eb98bd2fa3a97adc930c9d05f915a0c"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
