# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.11/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "08cc93ea48af91f6dcfc7bceb769d518a4ac49d4d30fda5d5954f4a1a4445895"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.11/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "b6d2ce6a314f7db5370a366f6dcce9f2df31df754343e9ea57fc5735b8dea2fd"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.11/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c120f5c66f7870c078e1e8dbaac8d7af45b0698c9194757588f82df9dfe72d44"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
