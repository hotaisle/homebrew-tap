# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.0/hotaisle-cli-v0.10.0-darwin-arm64.tar.gz"
      sha256 "9bd4d410df921a8e648e6467cf908d05d45837c33b7e530146b14b987cc51922"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.0/hotaisle-cli-v0.10.0-darwin-amd64.tar.gz"
      sha256 "d0b16ff6567059652e493de668af134fcf822c40fbd41e8db38f08bd4ac60e70"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.10.0-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.10.0-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
