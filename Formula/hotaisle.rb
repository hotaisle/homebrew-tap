# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.6/hotaisle-cli-v0.8.6-darwin-arm64.tar.gz"
      sha256 "93fb6487d4f8ab3e42268c52556f059133a0c49fe5c410f7d4d854cbee06d5be"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.6/hotaisle-cli-v0.8.6-darwin-amd64.tar.gz"
      sha256 "a5b54988548a1651afcc012b5b1885e16b79032555b5a0449e5c7b40aa710784"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.6-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.6-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
