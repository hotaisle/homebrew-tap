# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.16/hotaisle-cli-v0.8.16-darwin-arm64.tar.gz"
      sha256 "1ac61db5e2833089a49a92e031badeb5501318bb6e2bfa28ce145f498e3a4760"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.16/hotaisle-cli-v0.8.16-darwin-amd64.tar.gz"
      sha256 "f9d432271e76cdfe9b66edb3bb2191f0350f76eccdfdd1bd875f1772cfb5b339"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.16-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.16-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
