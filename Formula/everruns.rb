# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.34.2/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "b44552b13a1ccb40bd3225bcd70613dc78b2944dad6923e38a0531ed62882c84"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.34.2/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "37a3521eefe05d7d7173735b2739c42b9eed7cfb57359bf3c32b187650cbd135"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.34.2/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee2ae0e6ea134acc0cb9c7becc1c776a231c3cde3d6f3a098d67bde590545485"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
