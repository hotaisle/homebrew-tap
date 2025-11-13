# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.1.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.1.10/hotaisle-cli-v0.1.10-darwin-arm64.tar.gz"
      sha256 "de05798428ca0314f00c509e727a7c128ec72b1c26203140499ab325e3bf5aa5"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.1.10/hotaisle-cli-v0.1.10-darwin-amd64.tar.gz"
      sha256 "04c15aa2b2f9eca0fa6036807b5bbee0ec991961dd4609ec607fc72d6b90b293"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.1.10-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.1.10-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
