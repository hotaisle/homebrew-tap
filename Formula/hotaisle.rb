# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.7.0/hotaisle-cli-v0.7.0-darwin-arm64.tar.gz"
      sha256 "facb6efcd8127895b2b17191e17b5a20b81b9b3c637f3db046d8cfc53c7e378b"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.7.0/hotaisle-cli-v0.7.0-darwin-amd64.tar.gz"
      sha256 "17715fa67e6f2d93c9c9e94d20a40019da9a7bb7d362d98df42870484ba75930"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.7.0-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.7.0-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
