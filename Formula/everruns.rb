# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.13/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "08c7d7d4bc88243a6c28a6ec9e9c05c2a8d486f8c474b7d97da7caa41fd1445f"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.13/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "61edcaf1a04dba80fb2f7240f8271ec02514de772cee6c7ab15d855be7cd3ca0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.13/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e08cdfb73e3f80b65ac33548e00effc43e32af19b2eb97a6b636eccaefc0146f"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
