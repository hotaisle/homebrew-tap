# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.1.8/hotaisle-cli-v0.1.8-darwin-arm64.tar.gz"
      sha256 "87f78f3893993e5450ff694ea09ddb6159f697981ab9acbdb6efdbe1ff450e7a"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.1.8/hotaisle-cli-v0.1.8-darwin-amd64.tar.gz"
      sha256 "fb16e63e1cf7531834114827d73c3b429f86bcbb81be252247dc3221c1bd533d"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.1.8-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.1.8-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
