# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.10/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "e0a9e567dc2d1fe84979c4360e29470e2feb9281b401d461130ee31287532b4e"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.10/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "a96ff1e07310e01247cd47e8c904ca5061ee1965e79472342df979812c02fbf5"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.10/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "830a969d005a274a73f0eff7021a32f2828826efe4314a18363c717f865fad45"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
