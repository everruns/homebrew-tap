# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.16/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "86c9de456c7990f8f1050ae7205150709ff4ce7ce6b49185fbed5bad3010ba49"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.16/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "92a14963e3aab1d921250e166289ff977cde7a032b3a93a2d8889b001f30a19d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.intel?
      url "https://github.com/everruns/everruns/releases/download/v0.8.16/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1db080082f1b6d992a171b09eecc6ff554e550e7e68a63a3b9c3471521dbc15"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
