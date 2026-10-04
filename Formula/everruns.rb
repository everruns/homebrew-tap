# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.39.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "150b893489798e32e6a67078ac32c2d7bccfc184ec3f3fc5fc60d2c5c4050b8c"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.39.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "699900a2a046ae7ed75aa97079beedc44f3e190f3eb70d85db47b57d1783b7c6"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.39.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ded3f96485134a9cba7b7263974f76dcf474c0c307332d22e1a2e2ca2fdfa319"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
