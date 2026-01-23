# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.4/hotaisle-cli-v0.8.4-darwin-arm64.tar.gz"
      sha256 "f1433b2d4ead4262b9c4345b407ebaaa645a2807dc550958ce6ba17faea4dfa1"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.4/hotaisle-cli-v0.8.4-darwin-amd64.tar.gz"
      sha256 "320e09afb2e6876767bd121cdbb23ec9d5552e21f1775037e33bec87e10cb24c"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.4-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.4-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
