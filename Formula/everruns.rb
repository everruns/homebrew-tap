# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.13/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "9706173b8296eb5f577bf77c4748c47c652a1444bf81e23be55145c4a0a0a4b5"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.13/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "1b2bd9382c3400bcbd2cbd6911796ee8992d739172a23ee0ff3c0c6ea7887e9d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.intel?
      url "https://github.com/everruns/everruns/releases/download/v0.8.13/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ad703359840e962bbdbc13890d74cc3fadc2cb3ae035dcd9d93990adccbbc5b"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
