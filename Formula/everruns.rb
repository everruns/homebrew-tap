# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.30.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "305f9689b37b680749e54c2e9e412b2e3ba05fbdc8a0c5c4d172a744e0cc0933"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.30.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "2d69c313df77e9f793a3974c961b38035d700d5d99b9edbc67c3faee253c54bc"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.30.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a3885dcf27d13fa7cf55762774f964eefbbf28098d6118c8419a073d1286ea6"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
