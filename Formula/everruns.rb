# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.13.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "ccf9a9ea48b9ca416b347b22e5df0801215d273b64dc219beeefb8a70a27d1c5"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.13.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "ebfd093ed2e7fcd86eafa4c76b8d1b5869fe4564b333fa7c68c70a546aebc7a2"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.13.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5dead84d24199c3562980681d86159fa6ec666febc08f9ea3efb423c4070122d"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
