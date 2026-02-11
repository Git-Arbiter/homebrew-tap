class Arbiter < Formula
  desc "Autonomous GitHub Issue Solver with AI"
  homepage "https://git-arbiter.com"
  version "0.1.1-beta.7"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v0.1.1-beta.7/arbiter-macos-arm64"
    sha256 "b141679dfb6100b1bec4afb3590815661a36e90d7f5b26ea422a0ddec2898601"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v0.1.1-beta.7/arbiter-macos-x64"
    sha256 "57515aa1ceaa519ab5b45aee448e5c834ba688a1441565520187a0123913e19d"
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
