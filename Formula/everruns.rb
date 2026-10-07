# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.42.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d8cc84f0dddcb56a75d7c5272ed15996b647d0d09cb70777abdbc789315b7a40"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.42.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "159f421e56262f0f11a35d51996544752262330d3cb8eb73b70b5064494c0e3b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.42.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e0067a6dc74b203ca23b8358fb67e455a374634166610ef2f5c5b72b8417fa6"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
