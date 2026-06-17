# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.14.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d30267874c09001bc6172eeb84509ca0d5b3aa67b96e191512120d8fe332036a"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.14.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "6fc7aafe9b226a527eadd78f9b2adc76ab1570f820dfd1a653dcbb9378890ffd"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.14.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84cf3ddc93492f386ebec8d70b90ad0d739bb7188e1a7d62234337f9c1c1e504"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
