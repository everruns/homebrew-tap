# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.22/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "a9b2ec89ec3d5362ecd180999fba5b7268fbc1c90cc6e4223e33610e3b9bafe0"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.22/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "ea578b883c328e029b84eab9d1ad72c3bb49aa805f0bbf642bfca1c1cbdbc687"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.22/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dbe0985cf4d3054212c2e95cd07ae6d7a0b5f911f739abe0085c11b41faf07ec"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
