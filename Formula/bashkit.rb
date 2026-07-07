# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.13.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "8c5154cb4eb286fc372810a5098d3480eecec6f884932bdcf487345d635523b9"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.13.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "69f001eec1020e5038c7659fbe0f2778bc05ee8d78aaa925c10f8c0a561bf6ed"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.13.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a847bad89b164f7891a73ce4eefbfb3b3bc08000d09de6a6bff0c8595e73d303"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
