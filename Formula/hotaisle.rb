# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.9/hotaisle-cli-v0.8.9-darwin-arm64.tar.gz"
      sha256 "e5123d31107caffacc45686dfb30e94aaf1eb21481e63dd8774cf787e9268a7e"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.9/hotaisle-cli-v0.8.9-darwin-amd64.tar.gz"
      sha256 "943e1fec3f1f92bc20e573da485404f28903427c078a80b91597baae060740d1"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.9-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.9-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
