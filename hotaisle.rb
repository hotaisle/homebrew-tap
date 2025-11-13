class HotaisleCli < Formula
  desc "Hotaisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/vv0.1.5/hotaisle-cli-darwin-arm64.tar.gz"
      sha256 "161e4f9d6102d7502f485cde80504d8547bc3d6c16210080d791caf1daace645"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/vv0.1.5/hotaisle-cli-darwin-amd64.tar.gz"
      sha256 "6cd53a0e77ca114c803addb9fa3fe1fe47ad123552693cd28c04d59a4f77a579"
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
    system "/usr/local/bin/hotaisle", "--version"
  end
end
