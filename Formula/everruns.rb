# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  version "0.8.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.8/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "e9adb18d86eef868a5109097cd365f097b196b5cc6b6506456a4c82b651aa780"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.8/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "5b299c7908e5980144cdd126f843e3f2b563341e037ea891fe8bfd72f63c41e5"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/everruns/releases/download/v0.8.8/everruns-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6f05ec1edf82d7611f30aefa296af04eb0c5b6b9c0179161bf698f0a8b511de6"
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
