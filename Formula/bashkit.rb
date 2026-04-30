# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.2.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "15942d656169cde1bc60b31e5c0663620995f994a975d8fb7347d3135e494919"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.2.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "637903a7e94db225a813d7388d637d9d975c0938c340297134faa6e6f031b81f"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.2.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b77c2c2731fd897094351e7890cffec4cc82ca2cae23a480133e8b6d9ac3a0db"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
