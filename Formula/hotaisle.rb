# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.10/hotaisle-cli-v0.8.10-darwin-arm64.tar.gz"
      sha256 "a5e424e1be5f4e4ce2720cf94b5a1576e27984fd002a9d1ebc45cf8389eacc5c"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.10/hotaisle-cli-v0.8.10-darwin-amd64.tar.gz"
      sha256 "edeac25df5ffea9001ac0ef0ca277cfd957ad11a816fa70d0f93acc7c0475bc4"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.10-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.10-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
