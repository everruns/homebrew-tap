# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.16.2/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "99af900d3372aa3e01f9eb834ee98ce953216220d61f21471c9f2b25f126cc21"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.16.2/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "a0cbfe61e3e3c9ccf7dd6b18c81b72b1d6293df5311361e44497c3c16f6e59b3"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.16.2/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a31976062b94b7d93fafc7f83978565c97daef7409b2662b8d062a8ef8c17c2a"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
