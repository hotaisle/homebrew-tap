# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v1.0.0/hotaisle-cli-v1.0.0-darwin-arm64.tar.gz"
      sha256 "3069d56934d96a8bc653ab24704ec6d8347d4ec300b9927a5f31dc1745422fc3"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v1.0.0/hotaisle-cli-v1.0.0-darwin-amd64.tar.gz"
      sha256 "a8678ee882e4ffe4ef712056d36f4587596cfb21da19f7b1cc9d27bbb7c81b1a"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v1.0.0-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v1.0.0-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
