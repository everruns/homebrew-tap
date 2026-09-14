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
      url "https://github.com/everruns/yolop/releases/download/v0.18.2/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "2ae97547139195059e21b729cb87efea2a8eb308ad531874564fa55f2fa08a3e"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.18.2/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "2c04292c22be329d4e896fd9c71d06cff73f22ff3fa36eb321fa62068d89e33c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.18.2/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7c7bf6792ff877e1a3787b146ffadd403810e2fc5c8fd8ac6674a1e9913a513c"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
