# typed: false
# frozen_string_literal: true

class Everruns < Formula
  desc "Open-source AI agent platform"
  homepage "https://github.com/everruns/everruns"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/everruns/releases/download/v0.17.16/everruns-aarch64-apple-darwin.tar.gz"
      sha256 "6b7c032aeff0b0429572772c997a1851d28294f70d58eac7024c92f9799ff21d"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.16/everruns-x86_64-apple-darwin.tar.gz"
      sha256 "12a75dc50a8b79e94b7dfd5eecf9485f319dc12b25f39e122d05afb3ea266082"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    if Hardware::CPU.arm?
      odie "Linux ARM is not supported by this formula"
    else
      url "https://github.com/everruns/everruns/releases/download/v0.17.16/everruns-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce23b8aec7896aed7519c119490e3b461748912a8cddaaa668b0f473681627de"
    end
  end

  def install
    bin.install "everruns"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everruns --version")
  end
end
