# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.19/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "d9dc4d0cf23e29b4219d992f8d347b6eeefef83483b5c34a262345ab486d1f98"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.19/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "291ae395c89ecf1aa0d3fb46af4e246f222d1dd52f49370e047643690499ba07"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.19/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9dc737e99afbb52818c04fc8ef9b3e62e2d54d8a714dd850311009a4ee65fe7c"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
