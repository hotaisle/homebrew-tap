# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.14/hotaisle-cli-v0.8.14-darwin-arm64.tar.gz"
      sha256 "ef71b0078e2baecdbb2f503c7e957c461b1384cf4b25d6222bb70f34b6101ac1"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.14/hotaisle-cli-v0.8.14-darwin-amd64.tar.gz"
      sha256 "2c5ead07e8da549b37de61337bf2c9005d9dfc0fb5d3e84620f939a0697ada95"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.14-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.14-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
