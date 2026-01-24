# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.8/hotaisle-cli-v0.8.8-darwin-arm64.tar.gz"
      sha256 "9168dc4924adbd16dd33d08e3144cd29ffcfdd73e1026541e613b38cb2c7eda8"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.8/hotaisle-cli-v0.8.8-darwin-amd64.tar.gz"
      sha256 "d71c73ec169904a61d613ca70376f2a6bcefab899e5a022cfe0e726a4e61340d"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.8-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.8-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
