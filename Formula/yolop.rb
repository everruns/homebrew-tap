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
      url "https://github.com/everruns/yolop/releases/download/v0.18.3/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "7d8ff7d0281b36d3b9304994043b01618296c9854bab25eaa80984e8270c100d"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.18.3/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "d91279245004a853ef383325b5f38f961b7f82395ab5dd96b1a22b2eafa0fd28"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.18.3/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1f1bd4d8ca07aa10314e23eda970af85fefd4785c46ab58a31462d3813502d10"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
