class Everruns < Formula
  desc "Command-line interface for Everruns - headless durable agentic harness engine"
  homepage "https://github.com/everruns/everruns"
  url "https://github.com/everruns/everruns/archive/refs/tags/v0.8.6.tar.gz"
  sha256 "f9426e2d89bb0eba81b0ab5ec7723580820a18d38c143f85cf8944ce40ec0efd"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--package", "everruns-cli"
    bin.install "target/release/everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
