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
      url "https://github.com/everruns/yolop/releases/download/v0.14.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "1bd05b80a11229d31cca261d8518f54ea16a6d50ebfc7e9e5e55ac43ef2ce3b8"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.14.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "929b3b5203b8bfcc50dc0698e4ce759b434fa31831b59adad380f5760f1e7bf1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.14.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6a50665ea0f7cf6e52a1307651b8a328d56180236fea3ea9b6b37cdc12fb864c"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
