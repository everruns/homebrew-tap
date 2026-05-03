# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.24/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "27c96cb58d0d69e9051c70b59d5e259a348e83a7a6106c12edacff40bbfeb10f"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.24/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "4bae24416346ea4cf7047da0741c7700c2fad023197e3d0865d789f194540701"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.24/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69562b3d1cfce54da4d67a76355b855ac0c553048b1052eee29a0792a16fa863"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
