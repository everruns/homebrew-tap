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
      url "https://github.com/everruns/yolop/releases/download/v0.12.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "4b07159a2cf0a534a86db0865a67ab2c20d662bf48d6248120912e55d2544c14"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.12.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "09bdfad54aad6f3c5d9b170f54a13eefb178a98c115d01a5798c7e75652fea17"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.12.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d8cd2cf5b2930061257faeed8d301997095899d061fa11d27f0edde21c4f79c3"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
