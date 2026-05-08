# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.28/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "929b328d5ea48e6a791aa121bdca493227949cd8f7c43c0c6ae66f705b392235"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.28/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "c61feffc984acd0eb2409923b9166781e387691e8ad7bc53bf8ea25968ddd288"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.28/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b426263b73bf85493343702dec999755f6df42b45b3de356eec4ae42ea9b67f"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
