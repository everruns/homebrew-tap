# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.25/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "eef30f1f6f7cd197f4c2a08be75aa483e5469c9f83f156c1d4a8fe28be6aa88c"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.25/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "fcb38becf1b22e9a6facccea515be0ac1f13a58b15df61a8886ead52279132b8"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.25/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54709416a74ed41e11a76bd2ff855d728247cec3e6bb8f666a88147f2aae6af5"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
