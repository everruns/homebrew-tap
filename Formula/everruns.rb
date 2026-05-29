# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.36/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "2eb9a72f1f7c7e5b962f2a64b79bde9610e1d2c1fd1d650811d1a33c7f40a07f"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.36/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "2883a3baa0485df1faec2d2e70b74aae29643ffd8aa00b38563be6442dda1949"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.36/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68226fe68df41cce7fb8ab10c0c5fe306f15774742982ded23656bc0e68db0a5"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
