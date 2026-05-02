# typed: false
# frozen_string_literal: true

class Bashkit < Formula
  desc "Virtual bash interpreter with sandboxed execution"
  homepage "https://github.com/everruns/bashkit"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/bashkit/releases/download/v0.3.0/bashkit-aarch64-apple-darwin.tar.gz"
      sha256 "79ae48f906e3a17a49f1488ee876d17ae39b176cebb0e7dc618db3affce7ff70"
    else
      url "https://github.com/everruns/bashkit/releases/download/v0.3.0/bashkit-x86_64-apple-darwin.tar.gz"
      sha256 "009462e21f9c79ef08cffb1d0e839315becf71e8017b60ec2029d39e016620c5"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/bashkit/releases/download/v0.3.0/bashkit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "48d41ae516be62ea17dd5f1978541136ae07ae295b85299dc1855e2fc72f6e2a"
  end

  def install
    bin.install "bashkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bashkit --version")
  end
end
