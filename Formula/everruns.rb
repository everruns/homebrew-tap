# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.16.1/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "a2e4db219575dd26c33d19f734de8810d4f45bd7a7bdb259caf376d5448dc836"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.16.1/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "c33d065c3d4d32ba785a8c929a1590ad8ebab6c1a3c2ae4144a7a00ee6c11672"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.16.1/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ecb8e1a47ca8465cde8db50c280b1846936a84fa90118acf6b5aea15c21fdd5"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
