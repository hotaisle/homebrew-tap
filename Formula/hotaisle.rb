# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v1.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v1.0.2/hotaisle-cli-v1.0.2-darwin-arm64.tar.gz"
      sha256 "92881a39fb70976116d228e30dbb173e52ffaeea3f1ca1c0db8ccf6194e880cb"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v1.0.2/hotaisle-cli-v1.0.2-darwin-amd64.tar.gz"
      sha256 "48f00e55899ee636cfa9cf7dc679e6cf59cbe23000d4b9d8107188c5726b882f"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v1.0.2-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v1.0.2-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
