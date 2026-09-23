# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.18.2/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "9846e6cd5764d66737a791a05ec39c0aad2ae1fc232e18d268427abc2d6b78e3"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.18.2/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "474a305f9de7b740df9466ffbff7624d1987e2f66a021954720072ed4f822f41"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.18.2/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "be33d58ba2118595fc31add61834f8b3b01797b0a9a27fcfa7776cf813b02d93"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
