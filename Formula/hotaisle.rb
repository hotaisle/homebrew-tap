# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.2.1/hotaisle-cli-v0.2.1-darwin-arm64.tar.gz"
      sha256 "35f666399f774a6558b291075f2cfae79e910df149c3921e323213024422b7fa"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.2.1/hotaisle-cli-v0.2.1-darwin-amd64.tar.gz"
      sha256 "1e6f28abc60382647f6073c96c4f45e1a70eebb4660e1426c7df753ac7f5f862"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.2.1-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.2.1-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
