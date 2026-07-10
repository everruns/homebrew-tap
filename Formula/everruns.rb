# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.6/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "4825c220ccbf8a77082e7eb45494c0a411a3e746b16ddd5027358e6eff3ad838"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.6/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "a82bf06f954579fc374c610867074f5b79b6f79a309664fd781aee5f780d3273"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.6/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5ee8a5b22b949d551337e8309174b11bf56cefa9f94f743e554a821b49aff06"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
