# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.2.0/hotaisle-cli-v0.2.0-darwin-arm64.tar.gz"
      sha256 "8ec37332a37803a3f8f563b98879ac3e92d82a4cc340e62ca87c31507d68b9be"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.2.0/hotaisle-cli-v0.2.0-darwin-amd64.tar.gz"
      sha256 "a2e52b67f7a2ff9c4bea9046a6dd4eeddd1bb289d5501b98d809fed1c7c6476e"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.2.0-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.2.0-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
