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
      url "https://github.com/everruns/yolop/releases/download/v0.22.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "442abd23cc0a1adfb51bdbd2e91ccbf6312fb8097f5f15d3dcac8aeac9268a47"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.22.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "79b6bf07a216e9689bb433c864026b77563373dce4e1f1cf2f021f64dc00a601"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.22.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2501e87ae6ce70c35b3ca9d780a36c6fc165ec9714205e5837ed3f4e63cc3093"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
