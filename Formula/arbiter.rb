class Arbiter < Formula
  desc "Autonomous GitHub Issue Solver with AI"
  homepage "https://git-arbiter.com"
  version "1.1.1"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v1.1.1/arbiter-macos-arm64"
    sha256 "027aebf618a176ebdc6fa5133edb893be62dfdb4ead425a45edb9024f8c002c2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v1.1.1/arbiter-macos-x64"
    sha256 "cd3f1ba81749094162de8555c240d1d7af0e28c3456abd17f1bd81ce8c99d1ba"
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
