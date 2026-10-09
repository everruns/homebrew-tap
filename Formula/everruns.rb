# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.45.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "635ae72edd3b1272debc1cdde8370952cbec5acc070919c07e8732d226120e35"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.45.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "e890dc98f9bc026bf5c252db593e4e188d98d39e8fd2a32f2a1361af180f614d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.45.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c51708df395183075aa8864bcba3866d00bb5f5ae54c81ff04b268accac56d41"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
