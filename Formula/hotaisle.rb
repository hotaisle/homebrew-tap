# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.4.0/hotaisle-cli-v0.4.0-darwin-arm64.tar.gz"
      sha256 "d7d392725b6fd65e801e946b14716df003b6d5a681b4552a4645ac4c2241991f"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.4.0/hotaisle-cli-v0.4.0-darwin-amd64.tar.gz"
      sha256 "828e45b69b541d5e9b27053631b9f0609a272326cc465ac038b6f3fc7bfabbd5"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.4.0-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.4.0-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
