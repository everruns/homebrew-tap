# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.12.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "e9c3d43180edef79e5dd8bedd85a8fd5c1b33765bd8033ac84d36e559eda2058"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.12.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "984f5c3e103a684535bb90659ae5b2affd3ae47bfad2fc906213fdc93b5f35a3"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.12.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5d9314fe1bca14cfb7fd0e6bb379a715ff5c709369d7d6f029f519286d9bc28c"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
