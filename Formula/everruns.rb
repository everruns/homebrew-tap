# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.50.1/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "5c7bb1f2386c5eae2083d62b6c64083b0f83fc769751c34c5d5453d17d58cab1"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.50.1/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "2152c83eef9bcdd49d9a739b41e09e6c95e87eb5df7f2b6b19090ec79b5320fc"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.50.1/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cd7efcb66e3e6e09db2ebebaca28f3b4f72371df56a1feb491669ee6364fa80"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
