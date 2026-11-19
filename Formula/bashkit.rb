# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.21.1/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "08478407ac5a7141b8a18f162138c552e025697269fc2ab9b3f1870d2be16722"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.21.1/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "a218a1aab33f860fafc82259f4c6c692292b8ae98ac4327c8b8a0080c95000b6"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.21.1/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "069228736d12669678ad0ac47ac2d71ee5780bf6fa322729b49de8dcff40feaf"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
