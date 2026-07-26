# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.17/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "ce0835262a23a61b337307fc601c324b0193302984ebf72f52601a7396bfd5f3"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.17/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "ad115af85368fd4becb9ca7804602c9f5fc5774b4493bb6a8c9a440bd2515bf5"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.17/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa3528cd6c26de42ecd2fdd29b6da45d09ec41fd8806121de14098e68f8c9bf6"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
