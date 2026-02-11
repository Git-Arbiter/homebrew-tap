  class Arbiter < Formula
    desc "Autonomous GitHub Issue Solver with AI"
    homepage "https://getarbiter.io"
    version "0.1.0"
    license "Proprietary"

    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/Git-Arbiter/Arbiter/releases/download/v0.1.0/arbiter-
  macos-arm64"
      sha256 "PLACEHOLDER_ARM64"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/Git-Arbiter/Arbiter/releases/download/v0.1.0/arbiter-
  macos-x64"
      sha256 "PLACEHOLDER_X64"
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

