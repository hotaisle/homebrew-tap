# This is a template file used to generate the brew formula.
# https://github.com/hotaisle/homebrew-tap/blob/main/Formula/hotaisle.rb
class Hotaisle < Formula
  desc "Hot Aisle CLI tool"
  homepage "https://github.com/hotaisle/hotaisle-cli"
  version "v0.10.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.6/hotaisle-cli-v0.10.6-darwin-arm64.tar.gz"
      sha256 "0ca58df771539c305cf7cd30281c7cc0ad45204fd0f2590fdc79de5c08337ed7"
    else
      url "https://github.com/hotaisle/hotaisle-cli/releases/download/v0.10.6/hotaisle-cli-v0.10.6-darwin-amd64.tar.gz"
      sha256 "455e5200d33d7dd996e0a96fd3ca3696a0da44d59df68f147c0a181062dab388"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hotaisle-cli-v0.10.6-darwin-arm64" => "hotaisle"
    else
      bin.install "hotaisle-cli-v0.10.6-darwin-amd64" => "hotaisle"
    end
  end

  test do
    system "#{bin}/hotaisle"
    assert_match version.to_s, shell_output("#{bin}/hotaisle --version")
  end
end
