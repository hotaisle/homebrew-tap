# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.0/hotaisle-cli-v0.8.0-darwin-arm64.tar.gz"
      sha256 "4076ad7d78c6b77a8eb93c9a3cc191267e4e50659df706a60bf5ee24b8fb9278"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.0/hotaisle-cli-v0.8.0-darwin-amd64.tar.gz"
      sha256 "20893781683f7c27ecb6962342bc7e661d9276374ba09479bb689095231fb5b3"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.0-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.0-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
