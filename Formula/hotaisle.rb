# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.3.0/hotaisle-cli-v0.3.0-darwin-arm64.tar.gz"
      sha256 "e9776e72d185fda1553be5ce708ba6ecb3bc7e44d1d71facdecef03b7450ae4c"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.3.0/hotaisle-cli-v0.3.0-darwin-amd64.tar.gz"
      sha256 "c17c79356caade294d756ff59b737f2cf54e295269f17e4703a9bbd3762a2c2b"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.3.0-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.3.0-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
