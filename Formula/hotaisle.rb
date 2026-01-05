# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.5.0/hotaisle-cli-v0.5.0-darwin-arm64.tar.gz"
      sha256 "2d5ba436677fae717b85dbd20b1573923e9078534316018d0b2f54ae0619e136"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.5.0/hotaisle-cli-v0.5.0-darwin-amd64.tar.gz"
      sha256 "fb803df6f4b51d3e5a3ba8562d8d0228af9736dcbcce0462e0c52e04c0686633"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.5.0-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.5.0-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
