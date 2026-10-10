# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.47.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "eab438691d7a419432cc35a891fbe724b6152409a726045434d66f17a3d4baaa"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.47.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "897d9d7a16cc3b8e33baa1e29e635b7c9ec3dce3e8a0ebd908518185e336aa89"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.47.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a364c258308033bff0e8f5dce5d9b0cab780fc77a6a3572508e5e6301a6ff6c"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
