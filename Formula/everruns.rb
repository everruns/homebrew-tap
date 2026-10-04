# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.40.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "18e0c79708ba4f2ae6aa3420d47872a00e9af4e11e4b4e5047f4472cbf2f7284"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.40.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "97c09f32bf73af908aa11cbd48e8c5817f8559f23e705afef5669f7a9de15af9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.40.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce6a9f34362a950daad34bb4f9d81bba99fd6d4d6ae845f796a46446b03bd70d"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
