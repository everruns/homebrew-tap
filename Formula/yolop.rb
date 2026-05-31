# typed: false
# frozen_string_literal: true

class Yolop < Formula
  desc "Minimal terminal coding agent built on everruns-runtime"
  homepage "https://github.com/everruns/yolop"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/yolop/releases/download/v0.1.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "444f8a321f6a70a6b2fc4d1d4ac747b5a14110d8d51fed8ff83c499cd950e2ed"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.1.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "4312de995da63e5df66a3e660fcb12b1de4227f4cb83148159c6b466a7e01ea4"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.1.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2a3c1dfc1b463f506afe4f9fc4e5145271c4bdc3728d992ff65c76c7677c6db5"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
