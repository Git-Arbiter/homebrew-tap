class Arbiter < Formula
  desc "Autonomous GitHub Issue Solver with AI"
  homepage "https://git-arbiter.com"
  version "1.0.1"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v1.0.1/arbiter-macos-arm64"
    sha256 "74739b862690837e5b1d7724c70a7105bd2c039a666851d5df912f388b7180d6"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v1.0.1/arbiter-macos-x64"
    sha256 "8dc164c22fc55f13aacaf1fa4a26796b565ea55ad12aa6052b97530a36cfa588"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "arbiter-macos-arm64" => "arbiter"
    else
      bin.install "arbiter-macos-x64" => "arbiter"
    end
  end

  test do
    assert_match "arbiter", shell_output("#{bin}/arbiter --version")
  end
end
