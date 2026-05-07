# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.27/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "78c142dbb59c8ff9aae05f2bf960d18323e7c076c18f495e75223bec478ec9dc"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.27/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "a225544b01febb371192f2e654783fa86805adddb25567c714c2e04549c016cf"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.27/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac689dd251f38db24110f0a3eb05518726beffdb56cf35e8e2ba222fa5b612c7"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
