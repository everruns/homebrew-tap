# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.10.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "386c741500bf75326c1c8ca6f35996197ee86a5b18116a0605d0c2ede0839755"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.10.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "a85376cea71a6e097a9678c914d177c2e8261a6aeae063026ae7e7d695b673ef"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.10.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f9ca31bcc26caf1dc3e0b4e55c53aa7821ccf3d244d739278613fbcaf8e4c68c"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
