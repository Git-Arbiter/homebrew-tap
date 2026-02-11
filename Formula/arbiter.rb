class Arbiter < Formula
  desc "Autonomous GitHub Issue Solver with AI"
  homepage "https://git-arbiter.com"
  version "0.1.1-beta.1"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v0.1.1-beta.1/arbiter-macos-arm64"
    sha256 "3e395b30d7466be4b3e13b801c268b9c9a4ece74ae6359a8edc8b766220bfc11"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v0.1.1-beta.1/arbiter-macos-x64"
    sha256 "1aa17a5abfc5a31923b0f2a44e3a19cefc57dbcbacebedb864fd15730696e513"
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
