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
      url "https://github.com/everruns/yolop/releases/download/v0.17.3/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "01b1b92bd291586fff897ea3b7a8fe7354207185df87f25abff659b422822b36"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.17.3/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "4c32418d4330d01e21317b76618f041f9164dfbd7a4a262bbbfed7ad8e3db1ae"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.17.3/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "52b6d851598dd74ea7e37e0aa72f766c06e630e95b9f0a3266e34afed1ea847c"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
