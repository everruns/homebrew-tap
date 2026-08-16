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
      url "https://github.com/everruns/yolop/releases/download/v0.15.2/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "5c4dcae8363de642c4a9013cfd9e80f25c37d0bb0aebde6f13ca9dd5cdad5b8c"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.15.2/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "16cd42a5698e7c4f6cf80aceaaf0a98c1bd9a852927669a6752f0811737d77f3"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.15.2/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "055f457e19335c1d900b7384011d82678efc9c1b4828603fc70dfb817d48eca5"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
