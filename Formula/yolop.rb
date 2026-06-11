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
      url "https://github.com/everruns/yolop/releases/download/v0.3.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "ece91faf866d392330f64b9dd1ba1d59af0776d4deb1f78e533285effa85f58f"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.3.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "f70f26a923ad155bcd635ae0846edbe7a7fbdcd41df7162ec1f6cb7f323c6799"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.3.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8c2d397e6fe34e5c894157594874483a6301ff109a051060f41e034faf1c417b"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
