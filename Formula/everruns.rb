# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.51.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "2912ebca52faca353532e9d37575f3392541b5ac0120553e23abab37c48d6c79"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.51.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "25e28c361584a02350c6fe4b9dc41d17eaa4dece9bdc6e876c18f9b4cb263181"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.51.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de9dcca9b7a11dd361262c2ca6601e9faaedd8a9c09e7844d8638fe13e0d4ddb"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
