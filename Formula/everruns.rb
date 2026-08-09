# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.24/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "36dac84f78b8cafd796a6817af0c61024fe8af7d361f6f32280e339ac76a2599"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.24/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "7f4805acd773a3a22f04a17eba4f72f7b3d7137bdbab5cdb131f4042cd218137"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.24/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fade101ed920609efe0d7a834cb11732e2fd0bb0972733afbfd71e1414509c43"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
