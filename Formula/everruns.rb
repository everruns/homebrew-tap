# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.53.1/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "60200a3c31ab178d6ebc60cd249bf36d4e219fb66cfeca6f2239b2d95417acec"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.53.1/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "a39046cb87e64003204fdb247f9af58ba36f33d6002e48d5e740c833f16a3a7c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.53.1/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e8dc7615eb7799fc6834c814bc98e7f89c417d9f85125026f616d6f7283412d"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
