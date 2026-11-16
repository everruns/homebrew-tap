# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.53.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "03573eb279fcef88f25fa6d2003dfd711f4150946e0beb7bcec1bd4164882cd4"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.53.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "7f66ad12a95035675a7ae806b4c6b865496bbbdd13cd2b2b349d68c0442646da"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.53.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85a24bf89aabcfe367e25788f5cbf22a70e5b7afebf85b1f9b0e36039f105841"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
