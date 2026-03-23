class Everruns < Formula
  desc "Command-line interface for Everruns - headless durable agentic harness engine"
  homepage "https://github.com/everruns/everruns"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/everruns/everruns/releases/download/v0.8.7/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "a6c6940bd4d106985df6a10baed5440883ed06cac710bbb6733f3087f9f470da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/everruns/everruns/releases/download/v0.8.7/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba5100368f1d8832140d296b1b33506c6ec731b1c3e7210363086325cbcbeab2"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
