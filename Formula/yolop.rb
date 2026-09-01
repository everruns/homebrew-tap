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
      url "https://github.com/everruns/yolop/releases/download/v0.17.2/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "7cbbd90237fb06677944944e10c84b025b84d14c09f77f1cfb7b497e8c173a79"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.17.2/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "fd4d66fd0db0674d3aa8e2857431afc244b1715ced6564ace85db99c2d6bbe2c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.17.2/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a94a4e48c65533abf7c20e9282bb1474388d35ff93b9185fc330775dafde2010"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
