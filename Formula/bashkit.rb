# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.16.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "b6bbc23792269fbf30bb4ca41ae2ba96a24a0719abf11e98fc8cbb5ec778b53f"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.16.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "e736f37dc31a4b2539112d7340c184649c58b7d31ab18ac81f0e5dec7334bf9c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.16.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "99775bff70226b0574862ac46266de4c4de007a42a650aa818ed56cfadc2e5fa"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
