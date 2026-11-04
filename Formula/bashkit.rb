# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.20.3/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "b91b0fe4d346a4226ad02434752bcfa6140f48cab7b1e60404188eb9f494fbd3"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.20.3/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "5e9a7d061146896484d69e46fdb220a073b14b7412bd123ad75f890608e1b006"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.20.3/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "61a2db9d39b4e95ae611e0a3a94c44e82ab4348c059b1af516360c8b1105369f"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
