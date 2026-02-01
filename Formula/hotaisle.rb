# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.17/hotaisle-cli-v0.8.17-darwin-arm64.tar.gz"
      sha256 "70c486a909bb750e99c41c9ffb0cce9ee934af502daf29a54cc0ab8bf2cc8a43"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.17/hotaisle-cli-v0.8.17-darwin-amd64.tar.gz"
      sha256 "01979fd9c1b4d4d56bfdfb74ca2649920c01a12a2a34b71ea0b773dc5692b151"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.17-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.17-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
