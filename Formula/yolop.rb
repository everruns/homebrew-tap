# typed: false
# frozen_string_literal: true

class Yolop < Formula
  desc "Minimal terminal coding agent built on everruns-runtime"
  homepage "https://github.com/everruns/yolop"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/yolop/releases/download/v0.2.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "1ff9cb0180bb7d3537f00684f765c03f8ab1fa269e5d5fdb5873b377c08b3aac"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.2.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "03cf024a9c7de5255a32677438c36dc83fe43a78892d557882d952a019bd1583"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.2.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8e56604279d1eaabe861939d87e68ca6fcced22c8a56af53e8d18dde2e974eda"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
