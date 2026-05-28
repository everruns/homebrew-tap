# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.8.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "f2849d651b10a9db33605fe268a0b427ee4a4f9b664c00df71fc3911fb5f369b"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.8.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "9fd5cefaf82767913436b25abfa6ab27fb5392ca06f6efc33b10224c8dd3bb89"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.8.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9de0d419daca0819bafb08ddf16c82cc7680b72f554d7c5f6ebcd162845b5598"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
