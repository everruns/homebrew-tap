# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.49.0/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "02ed6ca495053d3c0a38950cb10e33266ba8e2356c19e4a477dcbb79a8cacc42"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.49.0/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "7011467a050b8a968a34fc1a9ea4292035f9b4f097ca375be7a32a957730e248"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.49.0/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c71a24efde0a48cb2a68cb82e0d32561d2b102366ec7a330ab072543b568ef3"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
