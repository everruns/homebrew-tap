# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.14.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "927384616c4c1c3af0c3d379d904791d3bcf5fdc71c2e94bb2457e87709cd02c"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.14.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "6118aecf22ec3dc2443e2012352c0669be5759c97f8b9b85da07b6ff7be81f6c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.14.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3eb18c0a1ae67e4bef3e3b4e6b18334502b8546109566fe8852553145639a26c"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
