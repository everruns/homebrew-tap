# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.16.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "1309095a357ac8f908c9c7e4157273448a9076b7650eef6c76efe86aad2cbef6"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.16.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "df298b09e9259ff23f61fd0464629dbc190436000b84b78fe83ea90f9a3ef432"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.16.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a3ffd7bcf64a4b4ffd456e30ccc917dcb3f84b4a5959c79d93d4eee7a4c3f90"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
