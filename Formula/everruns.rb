# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.5/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "f8f5daafcced21b6088983ee3613031cf273558218446667e06f794bb2a9deac"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.5/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "9a414998c7225f0db2b5b7bcddc313ef00e049321bf815614bb8819ab84639c1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.5/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c5c2a6e48c7f151950f10e75870f0d63720357a561bd3104689a62c2fbe2a52"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
