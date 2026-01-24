# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.13/hotaisle-cli-v0.8.13-darwin-arm64.tar.gz"
      sha256 "66d797297df2270fc616d26f7a4ba827804f07cae2d61b2e1d066f8b261dd31f"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.13/hotaisle-cli-v0.8.13-darwin-amd64.tar.gz"
      sha256 "11b8702c8adf3217141a4969f1786f305972ae18a08e25f1548113182c02834e"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.13-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.13-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
