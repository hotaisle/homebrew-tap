# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.10.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.1/hotaisle-cli-v0.10.1-darwin-arm64.tar.gz"
      sha256 "7d9d0fc2c9f98fd5f622636611dc7f42f292ab81bdf036581081b9d15fe6a9be"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.1/hotaisle-cli-v0.10.1-darwin-amd64.tar.gz"
      sha256 "017fbae9abac9378cf7446e2ac46d897d4ba5212301a68fcd7d1270dbc15d517"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.10.1-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.10.1-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
