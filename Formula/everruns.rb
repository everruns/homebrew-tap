# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.33/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "a5d02f0e634926aa52370618b51d5059fce6b6a2143e0653042f9577dd155138"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.33/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "601ed4cd55bee1c40b0d8beffddc7f529a843b371c38011347934070c7810859"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.33/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "584d9dac17965918b053352fc582130ab2f6f7dca333965ef7e7caf4cf2489f4"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
