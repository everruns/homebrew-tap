# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.19.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "f41ea18e66f5ae4679d428bd79ca584126ba958964bba0567b1e3e111b5a113c"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.19.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "70db11310afac65ff79437a55e0d9cef05d58c80eda69134bee19e526c0e3220"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.19.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d78238ecf2eb40a42fd7af20e46ab8693537f2ae1baaa6cd981d448c6f83f952"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
