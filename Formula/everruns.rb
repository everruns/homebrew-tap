# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.17/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "b96666126c8b3dc8122d179f36d8401e932f1ef5fe54d4628a4e545bf6dece25"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.17/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "6d6950aaf04e0c00990a5787c6a35aac0a0416d210ec4b19932240c0f1821bd2"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.intel?
      url "https://github.com/everruns/everruns/releases/download/v0.8.17/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c50b61418b3f432c9ccbfe602e6dd6bf76d0c042fd410c3a48f2a64b85b8cea9"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
