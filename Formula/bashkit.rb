# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.14.2/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "52332b1cdee4ff4dc3949a2a481ca6bbe123fb524ec2597f85611f0614274b82"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.14.2/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "098481ef81a642928e408a4580bd07b58fc86bb929c9dcd6ec219f487c74b2a7"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.14.2/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f13fea9805bc364ba9ae95e4541b3f84eb7b62d871e788d84fa32110ad0fb9fc"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
