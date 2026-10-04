# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.38.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "e0ec7bf8df3abfec3217906e5be19223a57e7bbff95b9c4ac568c51240d3c589"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.38.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "d91fd2f41c5727c3b5c20a513a0c74cc84f5ef80dc24fa397e1fcc03170b516d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.38.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5a4da407177f9e57e712141c935195a339ce2111f573025ec6ceaec5a5f21e7"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
