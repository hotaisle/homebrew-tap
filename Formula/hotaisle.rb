# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.10.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.7/hotaisle-cli-v0.10.7-darwin-arm64.tar.gz"
      sha256 "f66a1a1dad56a353234a2e6db6e083b734fec725c559bcf1b348fb80ca3c400a"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.7/hotaisle-cli-v0.10.7-darwin-amd64.tar.gz"
      sha256 "a805714869318511be717ee564c6e0e9232d3d1e2218357b3c1a313fb0069bc3"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.10.7-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.10.7-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
