# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.38/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "e63f777c149191a53ec801aa8fb7b56f1aa7738587c37fd7792a4f44cba360be"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.38/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "41412ade39a3fddff8c954440e8f89f10ffe38b9d7d859988aaac4db0bc12b31"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.38/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65426bca8b1cc4a5303718e83207d8c0590d3c86164fa393c07aba85948804f6"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
