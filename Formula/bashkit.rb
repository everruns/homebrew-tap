# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.9.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "788184f65eef53939096c9b2b91f76836353675f3be5b76ec4a841a025d65825"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.9.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "c26ef767cc0ab157b21fee8e5589177eca8e10960d02253c7665f18addd7dced"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.9.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "36b57dc7ab513050190a93e72568e152ad63473424a93b760766438fc376e7e0"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
