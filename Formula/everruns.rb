# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.21.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "a2e15d7e5b52bcc9dbd5be903d42f80f6758445ce3d7bdc16d5049ad3202ebd7"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.21.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "f46c5ed109de02852dc4c371f0ff5df7807ed5bfd7827faa34b2ed9bda76b6b1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.21.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e215ec019c964ad277f6f810699be3579b5826b3edfd89bcbd944fb89fe180f4"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
