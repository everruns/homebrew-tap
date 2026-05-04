# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.4.1/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "f9f103d0b7d2d6d425e362cd8be91b5a5f3d649910cdd82a143e8fb23001fc14"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.4.1/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "67e1bb09a0b411158e8d9da109b15eec3f6467b9fa04e3ba10e07f4611ecaaf1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.4.1/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3736fd8054b4c33047a6707c23b36e02386b7787094780c88ebeec4c21fd359a"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
