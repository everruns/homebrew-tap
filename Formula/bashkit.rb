# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.6.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "45f5a1a50d7ba5d3ffa61be83ed77e8d4d9b54153977a81dea94cd42a8818b92"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.6.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "1353ae17bcabf7dec257700bf46fe69f1fe8846157e7926ce49f7b4bcb8bdd87"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.6.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "08439949b9abc1f96b21c37494b7766cc0e6eaf551bee0447fb7df61c1422cb4"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
