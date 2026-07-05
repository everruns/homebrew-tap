# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.4/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "91a5c58a0e640aa2458d4aae8af6a99c3fe514b80850afaaf6d07f859182f02a"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.4/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "90c261a967831d4125df73f5a1fa40f940c635f5ce1b3e996a981150925b7c6f"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.4/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e597e2474b2213795b7cfc4e6896ac510024cff77b2064bfd2abebb8d5c9c09f"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
