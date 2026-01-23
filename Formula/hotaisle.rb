# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.8.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.3/hotaisle-cli-v0.8.3-darwin-arm64.tar.gz"
      sha256 "72d793c799012a712e179765860bd8d3dacd254b6a047658b875cb20d6c96987"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.8.3/hotaisle-cli-v0.8.3-darwin-amd64.tar.gz"
      sha256 "7d324a4fd83878b29873fb2617bf0822daa168833250f09d3b5108bf42a75ea5"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.8.3-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.8.3-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
