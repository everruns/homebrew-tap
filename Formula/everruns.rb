# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.31/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "e0fa36096c735455838810987d1785ab166e40e86f204cabd785d76c054d81b8"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.31/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "dc9e0efbde094d14e083c2f2a6c0dedcecbbbec73865329d9e3040a70f1f870e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.31/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe17764ef5c4352bbe8a4c5332d11e769008479a1d9b9a09c69a3f29210fe117"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
