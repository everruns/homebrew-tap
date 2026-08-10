# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.26/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "393dc1e14cfca82f3ce3c7b45804b02033583f1c36a48f0949e8887a7f93a14a"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.26/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "d74f0a5606f7c44cb5a6e21abe81a3b2a2cf5302e682e99fc082e0eb785b56eb"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.26/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0632ec26d1488857e35b881bb932c54ddedc4d341505689d5bc68f96a68646ca"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
