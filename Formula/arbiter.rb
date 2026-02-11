class Arbiter < Formula
  desc "Autonomous GitHub Issue Solver with AI"
  homepage "https://git-arbiter.com"
  version "0.1.1-beta.2"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v0.1.1-beta.2/arbiter-macos-arm64"
    sha256 "530d7ea71b4d201bafe8b8ff382c36be14ec8ede0d7bdbe3c4c5b70ea844a342"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v0.1.1-beta.2/arbiter-macos-x64"
    sha256 "99ac0e71757f88e9a4f213d2054fb11706526a36ed4172f843c8a3ba658f9c58"
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
