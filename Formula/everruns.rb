# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.11.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "cc1c7130ebbbf5cb5b8112391d9a01aa01823cdb07619535dd7460461ceb2ba2"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.11.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "dc710d49c578b58cb3d66d67ca0206da2327f84120b56be637a7a8ca1dc91234"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.11.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2dec26a3f0642f0aa40c1752ed567aa43f67df2cf525b2616b46e0fc9a6ba99"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
