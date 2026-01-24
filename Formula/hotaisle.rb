# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.15/hotaisle-cli-v0.8.15-darwin-arm64.tar.gz"
      sha256 "c2f62d61296685f5e6444c68c48bfd264383e4460faf3a2f9d5eadc1b2ec3bbd"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.15/hotaisle-cli-v0.8.15-darwin-amd64.tar.gz"
      sha256 "e28c7787c34524f0af0631ba4a3b6658f40ae23f172f1cc9c69858b93d108652"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.15-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.15-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
