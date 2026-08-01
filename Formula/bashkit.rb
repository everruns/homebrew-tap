# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.14.5/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "f46e752a1c54cdd9e9e5932ed39ed68b354af1914dc3ba1b44c0831f21b3f417"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.14.5/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "dd9c4d824dddb74f71b54d57ec5b3a3d696f1d39d693857af9f0b33b5bc4483b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.14.5/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3b6f5f04394d33361c44d1b5a6d3a75c513fb7a972b7de535ddf00b42f764c23"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
