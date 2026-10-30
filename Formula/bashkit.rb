# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.20.2/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "493b3acf27afb47f1c7324b64609f7158dcdaf8c2f81026bba98df561f9537cd"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.20.2/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "96011e8c5f93433e899921fc595c3827bcf347779adccfdb71577e7c56f15da6"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.20.2/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0e97941ef5560dfdb930c49c5d3f524ad46f0629749fe5809795a0650a77fbbb"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
