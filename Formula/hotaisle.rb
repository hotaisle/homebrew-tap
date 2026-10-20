# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.10.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.8/hotaisle-cli-v0.10.8-darwin-arm64.tar.gz"
      sha256 "b28351551a9788100a28335f08a6da85aaa8ad091e384ac08d6f43becfbc5d04"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.8/hotaisle-cli-v0.10.8-darwin-amd64.tar.gz"
      sha256 "e4a0b2b00f59e3591fd2e8bbc6ff7fd034ba7418bfd5872912d952d5005c6ca3"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.10.8-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.10.8-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
