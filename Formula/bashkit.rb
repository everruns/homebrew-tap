# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.17.1/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "c621eee4062fc8433d86480acade711b4a89c378a49fde1ff91fcc3cba7e2d7d"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.17.1/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "7fa198124be360912e6be9234026e3805bdcf7b606e58c1c8db12b6301570138"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.17.1/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "44aaf1787d0da9f1e5cb545b3a4bddb1c1e445fce64601f587ea7837743c18fe"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
