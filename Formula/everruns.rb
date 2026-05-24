# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.34/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "931703c21462299908671187ab9a16b0295d6a9f2f7a6348b29d4d5c14478363"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.34/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "5dd082acd3b45a307eed02ff8a69b0f1e35ed366dd9175737f2f986652018955"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.34/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99c5cca5e167e4e07e0b35735d1d2ad4483494d72f1b8361e4a7b7e6c8f2dd89"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
