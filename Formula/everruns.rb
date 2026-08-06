# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.22/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "a2689a5cc62bf222d6b26d2983e5524bcdd0d235d8866f90b77f6181b5bf6324"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.22/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "f98b919988ca54385ddde5ee667a9881d64f573867d72e55b2f25597924df00f"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.22/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7d2afc657dcfb31e75ee0a0da63a6b6e7b345750fa331263c8e907f0bc65d13"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
