# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.35.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "0a10511022603d5207611182c33bb07696aeda053952811c7ee184d93b0c577a"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.35.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "19c0fe2d8b68e9f20332612352840d3d7f75bc93ac8045d15d9b242577e64eb1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.35.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98fa46716dfa2cde3befc9f0a68eeaeb749970d428bf253265a856cf64e3751c"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
