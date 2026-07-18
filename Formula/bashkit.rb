# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.14.1/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "9761f62a73589033fd60209273019fc7febfcd93e9aec2eea3dec641c211f19a"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.14.1/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "21809c63e0c8167da84006ae6e95d493bed89cf1c2d5fb701672308c6d84a84b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.14.1/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "33a182dfd72ded3dca8df65deac744b97ca53b87ef25e487698bba187be88129"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
