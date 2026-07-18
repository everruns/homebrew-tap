# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.14.3/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "35bd272c3ac373caf7da25b36de3e3bb939d56227a4ee2ba983be2160855e78c"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.14.3/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "78292a873e70155c00f183d4e442d7739db9ab9c99cb257aa2f4e6f80839e416"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.14.3/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4ccae46abd9e751d06a5ea49ddfcb34c06be2422504ada0b8a6bab28acb2505f"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
