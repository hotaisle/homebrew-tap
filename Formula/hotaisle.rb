# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.12/hotaisle-cli-v0.8.12-darwin-arm64.tar.gz"
      sha256 "ff131f8bc79a0bb6d3cb18973a0b6756eb9a606dee24461dbe0fcf98794f5e79"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.12/hotaisle-cli-v0.8.12-darwin-amd64.tar.gz"
      sha256 "5f7e33ee71725959c04fc6b94ce022694bb72387a5238058065a8ffbd7c992e7"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.12-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.12-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
