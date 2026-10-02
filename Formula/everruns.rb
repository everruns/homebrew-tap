# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.34.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "4741e5e1620de34ce2007479dfe0d4c433a53fa3eef7a0d3a5c08c41ce36a612"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.34.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "ced7b22864214f5454225297afb677703bf5681b448650b879b76b37af4f343c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.34.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8211aa4ab5f3637a559159bf10bbee790afaa837419ead712a9ee839397bdbc9"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
