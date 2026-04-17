# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.8.14/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "3b0a41b5f6574f45d98bbf69a5826b26fc09ab6046836a7c54d7331974e8f89d"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.8.14/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "444ca9c4db796f6b0cfabcf25a90730eb8ec6d5e13a5ea387eef10bdbc70b57c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.intel?
      url "https://github.com/everruns/everruns/releases/download/v0.8.14/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df500b15ea7d4bb4dc718a7b8beb7aae4c6969d79833442696e6712f2624c53b"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
