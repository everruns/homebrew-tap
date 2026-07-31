# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.18/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "35353434c762c24df5e9af61de5655ce747a798866d0a650d7e111d51af5bd20"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.18/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "9053ab2b732ef48bc17a00c15b86d7a3a7bb8ea72dd31cc36c7d3f6a6fddeaf9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.18/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c79566fe1d58064283a44e3859c91964b12fda54b4b545bfa4ed0a66c5d893e"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
