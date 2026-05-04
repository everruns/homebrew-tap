# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.4.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "a48fcf153190e9beab8c8593a1b279936727949ef67a47811badeae5224d6244"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.4.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "1dc290b12b9570c83ce07ac20bc1c902d631c092819a1fce931c77b67b45f5fe"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.4.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "74b3933ddabed709757a4ceaf8061144db6a76b1abe5a94609f6cfde7a4b3708"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
