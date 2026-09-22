# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.10.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.5/hotaisle-cli-v0.10.5-darwin-arm64.tar.gz"
      sha256 "a3a2fab22df02e4ed1a59a65b73a341594101742133664f7aca115768d819310"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.5/hotaisle-cli-v0.10.5-darwin-amd64.tar.gz"
      sha256 "3b95fc8f8ce174ee52015ebbe3ed7a67c7112c045eac8743ebe1da56315eb17e"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.10.5-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.10.5-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
