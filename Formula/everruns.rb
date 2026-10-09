# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.46.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "7df8a6daf116a805113aa76b6381c7b5b927ffda0bbc82c67ef8978e4c844b1f"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.46.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "e33df12f60112434c0f9de9586daaf9ca9d2cd228211d8482a0af52becd548a5"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.46.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55b09542a2d0cb00513d56327c63ff45ce64ba301adf86f10a7f0b5e4c0b6d43"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
