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
      url "https://github.com/everruns/yolop/releases/download/v0.7.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "58c44b1331b4c83aab3837c0b0bdcec977be0661e38a5f02451f7875f8f00315"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.7.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "1f746db910ad8deacd46759544a96bd1ce9458dea9cbc727160c75afe351a17d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.7.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eceb3c637b7d3040c6e6bd5f4bbe9c52032219ee06c2dcaa10e6a77151f4f3fb"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
