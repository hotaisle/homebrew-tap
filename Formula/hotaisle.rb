# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.1.6/hotaisle-cli-v0.1.6-darwin-arm64.tar.gz"
      sha256 "f8fa8d4a85dda2092678a3968acaeabe4497bd214ae7916bd468de25e1c2b522"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.1.6/hotaisle-cli-v0.1.6-darwin-amd64.tar.gz"
      sha256 "80c8a787511f0e3d90c9b76c57e31867223a02490d2dbd9d9ce1de7969c1e446"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
