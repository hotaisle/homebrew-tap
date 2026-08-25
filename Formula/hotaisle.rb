# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.10.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.2/hotaisle-cli-v0.10.2-darwin-arm64.tar.gz"
      sha256 "52880b42570902fdd1e57c51e10e9cc27c40f5e7f6fa853095d4cd6b844a3e50"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.2/hotaisle-cli-v0.10.2-darwin-amd64.tar.gz"
      sha256 "92baa856040b4297c12c4e1b27eb7a8a9942061cc483ba595845396da46c35aa"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.10.2-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.10.2-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
