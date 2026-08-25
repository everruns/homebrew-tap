# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.22.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "74d47f3aafbb61489ca1925e75a397d44b24336266d57c18dad76a9b33520787"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.22.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "4b794e227a0d46295ecb5c72921426c77dbe3bf105ff898df32255baa0a2aed5"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.22.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ae4610d582449ca93d190b193645e5819a585267edeb197922d127e81e7e5a64"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
