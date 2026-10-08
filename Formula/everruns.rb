# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.44.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "1783d75fb8871b4fc19b4b66a6b36fc90e1baf38e77db52e04588c4f2def1dd2"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.44.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "745caac26e3349f1f25f38fe4bebb33aa1dfeabd98e6dda49f5bbd24a6d17d6a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.44.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d0e6918e3a43b8cf70a8ea83879e50dfb7b30ad832e4e4b24b6f58a6ad864c2"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
