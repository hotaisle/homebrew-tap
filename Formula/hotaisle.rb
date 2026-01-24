# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.11/hotaisle-cli-v0.8.11-darwin-arm64.tar.gz"
      sha256 "e05c107595b8fe23e6908ec79afe8e25de6738832251212e8e8410ff73de431d"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.11/hotaisle-cli-v0.8.11-darwin-amd64.tar.gz"
      sha256 "00774c40e6ffb6024ec5d264bcf6e28f9f8de257e7122a10f94f6978f1de5828"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.11-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.11-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
