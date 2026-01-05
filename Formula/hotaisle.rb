# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.6.0/hotaisle-cli-v0.6.0-darwin-arm64.tar.gz"
      sha256 "92bb950576e84206a49ab248a8825cdd81c4a86235fd657fd78ff82c85d90265"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.6.0/hotaisle-cli-v0.6.0-darwin-amd64.tar.gz"
      sha256 "e26c9413986c1cf9d87fabb28d472b75a7f794169eee0a42faa46be93f20d302"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.6.0-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.6.0-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
