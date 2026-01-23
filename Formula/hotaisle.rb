# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.5/hotaisle-cli-v0.8.5-darwin-arm64.tar.gz"
      sha256 "c0ff9b13b4376f4de6083790a40c365844e421b581194475d1c3b92b70ef3b3b"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.5/hotaisle-cli-v0.8.5-darwin-amd64.tar.gz"
      sha256 "bc7b8386eb5ee66cf74e1a174f918452a972b34bef7fb6e9c6335732f2f7350d"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.5-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.5-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
