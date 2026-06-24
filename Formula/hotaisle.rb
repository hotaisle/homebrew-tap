# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.9.1/hotaisle-cli-v0.9.1-darwin-arm64.tar.gz"
      sha256 "1ecc1b109c54b36c04b44dcc9ddfdf25d13a437512ea112c2232c9a334eb430d"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.9.1/hotaisle-cli-v0.9.1-darwin-amd64.tar.gz"
      sha256 "6f0601d45309624c07dcb8acc653c841887d4143b84f88798537e3546505afe9"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.9.1-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.9.1-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
