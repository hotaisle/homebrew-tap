# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.2/hotaisle-cli-v0.8.2-darwin-arm64.tar.gz"
      sha256 "23ad3fc38e17faa1af6581d8934e87d5f712931e5c4b14e5b82e48d949059fe6"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.2/hotaisle-cli-v0.8.2-darwin-amd64.tar.gz"
      sha256 "0355d078376cde127f7c15fe87ea7c0868e653d30cace7ad6c1276a021532d21"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.2-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.2-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
