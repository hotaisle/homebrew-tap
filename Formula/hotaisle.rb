# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.9.0/hotaisle-cli-v0.9.0-darwin-arm64.tar.gz"
      sha256 "da0a9ad5a220389c34bfeb227809c0b227b3a2c62e5e8bbcd54c22c14d9efd65"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.9.0/hotaisle-cli-v0.9.0-darwin-amd64.tar.gz"
      sha256 "01866f45b111133ae92742a52748519c649495b7e08e34b8f74cd053dedf89de"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.9.0-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.9.0-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
