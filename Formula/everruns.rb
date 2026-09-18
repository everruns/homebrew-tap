# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.29.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d88938958f7c0e2c91af31565d7af7b324d7053ff4af0e34dbbd3cb375fcd8b1"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.29.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "7984abc59256299363550345ecb84585d9f48fe5fb29c09278ea9afd1449c506"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.29.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a1812054b8c6946306d5f4eee4cfde33aa42b6166b64e32a7ca4bfc9a624daa"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
