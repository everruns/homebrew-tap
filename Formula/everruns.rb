# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.32/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "4418818d2810c543ca2744168dd6a9a6ee1a0e79cb6f60960a3d647f67ed6271"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.32/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "6469ca2aa9afeb11ae2a50fb28f39be4bc157dffbd6561f9bc257a937a0106ed"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.32/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ccce350bf791fe98831a1559b7b7fbe4d09eb5853dc3603bf39a2bb7ebaa686"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
