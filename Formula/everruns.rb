# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.12.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "ef0da40764e82dead5d801747d9a4a4289fd572fbd573596983101bc2b8bdfaf"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.12.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "c468d7d2cd24e80199637e13052bb067931182cbe5df6252278382045f66d178"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.12.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e236f26a04703213b461b15037b6ce22034988e010d79144a242f8969f31f70d"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
