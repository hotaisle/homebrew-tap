# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.7/hotaisle-cli-v0.8.7-darwin-arm64.tar.gz"
      sha256 "834f77360650a017b2a2c184e6b205bc32711f9d1d74d0386e0344b882ce0f98"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.7/hotaisle-cli-v0.8.7-darwin-amd64.tar.gz"
      sha256 "da3abbdd19e0a415fb7c6eea18c5bd04a14f20686aebacae36af078f67004e3c"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.7-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.7-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
