# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.35/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "9ca0ebf6540d95ce0b3499fcea5849455bf035a50c65294cea73c91dbd8cf006"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.35/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "5f7d39988368171f757a6758c34af7e74d6654ea340a72bc8ee442202453bdb3"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.35/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62d7535666729a098a64d441c1cf66e446361e58286234b4e34e8c897511c3b3"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
