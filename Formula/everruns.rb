# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.30/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "611f2172ed3a70c6f3a0dd24554447c0b5ef9fca17013f5e4ad071e31ae1f3e8"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.30/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "6a7c608cb78462e422d677f6cdf64a28939ce9338d6af826293b571e298fcb46"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.30/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bee12049aebcf8c1d93765cec44e5b8344880fdf2fb4f84721be2d3ce5365794"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
