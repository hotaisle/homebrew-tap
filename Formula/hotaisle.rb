# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.10.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.4/hotaisle-cli-v0.10.4-darwin-arm64.tar.gz"
      sha256 "e2ea729b0f59d1a76107c06bfc3b3b6d320a55297ce790ef9a38a1e2598c9139"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.4/hotaisle-cli-v0.10.4-darwin-amd64.tar.gz"
      sha256 "e7e643564a755f09afa3c2f7e34526d9c3d6c2df3050b0e93f80db4446b5779a"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.10.4-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.10.4-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
