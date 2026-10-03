# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.37.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "053e426057ba80ececcd010a64c9b98b7040677fd1a2b5d06eb33fe61b49fff9"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.37.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "f9c9cc447395e3cf80c64316334015ac9741453128f5b4c84f2df768119d468c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.37.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cba08b9581d1a7cfdc3f7f9f1f34504461eea75b5ba1d10eeb4281014765c1aa"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
