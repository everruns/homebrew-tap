# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  version "0.8.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.9/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "b3f2ee6a9036f48d166b9791a236016fa71ff7ce9385b13ee0f6e75996f2fba8"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.9/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "bc8e73d66e8972e9887f829cdaf3a2e7d2207fd31e8b57356a12d75281e1bb46"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/everruns/releases/download/v0.8.9/everruns-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a35f30b33496c4b8019dc8f2a928fe93e3148e4d8d4e7df8b1fecf9529766864"
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
