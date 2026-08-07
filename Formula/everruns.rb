# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.23/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "cf47d87580546818a8032e137ff1d19fc696425b0fb6ca2a57d5d055c220364c"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.23/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "0b24d2193119cddd4ef49616b79cda494438e941c4558e02c76784913357a773"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.23/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac10080caa363abb7ff5387c1446b3df46146aeb38ff1c0e6eaef5c1325d44c2"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
