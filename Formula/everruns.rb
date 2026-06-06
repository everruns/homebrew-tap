# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.9.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "4b6aa777f58371f90f7aed99b6f92e6923de562f1141eb03e4d62e47712a068d"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.9.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "8b6b6df6e660d0a8f1e9f3beef23e29876e11263872de6de31307dc047c89546"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.9.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c365a0d13bddd7f16b6e0ea9a93fc0d889c6b833f414bde3592e73acc5f373e"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
