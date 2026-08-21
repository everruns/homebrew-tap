# typed: false
# frozen_string_literal: true

class Yolop < Formula
  desc "Minimal terminal coding agent built on everruns-runtime"
  homepage "https://github.com/everruns/yolop"
  # No explicit  — Homebrew scans it from the download URL
  # (the release tag in the path). Setting it again trips
  #  with "version is redundant with version scanned
  # from URL".
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/everruns/yolop/releases/download/v0.17.0/yolop-aarch64-apple-darwin.tar.gz"
      sha256 "1aa6b94829fef33ed32dce41109963cbbacbf41c530493a4a51dedabd35622dc"
    else
      url "https://github.com/everruns/yolop/releases/download/v0.17.0/yolop-x86_64-apple-darwin.tar.gz"
      sha256 "700a76adf892920ab536c6f2cba4d0e782c559cd95066235ac5938b5492adcdf"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/everruns/yolop/releases/download/v0.17.0/yolop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a4594f3466253244b6b93ccbd3bd627159920ecead918b8097e119bf11edf0ed"
  end

  def install
    bin.install "yolop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yolop --version")
  end
end
