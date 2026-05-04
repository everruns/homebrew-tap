# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.25/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "2e2bd26f77bad6353151fdfcb4b422bd6b433b677abc5d0def1c3303252de91b"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.25/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "b61b60521f7c35bc4fc3cbeb006436b4114fc87b4995f97125c1fa1f37f7bbc2"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.25/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bad8c4e2b1136e509172e5e092329c076b65c703765d9e5e2534835ec8342c72"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
