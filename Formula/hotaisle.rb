# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v1.0.1/hotaisle-cli-v1.0.1-darwin-arm64.tar.gz"
      sha256 "d0ee71445820baf134c1a77952a845410f3a6d31048421ce531945236c8c49b8"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v1.0.1/hotaisle-cli-v1.0.1-darwin-amd64.tar.gz"
      sha256 "929db79146cf329519ef535f2e8b8b1d46d7d11bdcc38389474ed2bc47db40cc"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v1.0.1-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v1.0.1-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
