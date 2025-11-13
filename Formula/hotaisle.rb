# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.1.9/hotaisle-cli-v0.1.9-darwin-arm64.tar.gz"
      sha256 "4abd0fe298d08e3af15e5a8a569adab8ce3e16571f867c307c5d20854d8f26db"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.1.9/hotaisle-cli-v0.1.9-darwin-amd64.tar.gz"
      sha256 "5ce81c9b68da77899501569b7b0079b1ae649d2075ab7adc5c05f95f75d344bf"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.1.9-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.1.9-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
