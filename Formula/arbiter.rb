class Arbiter < Formula
  desc "Autonomous GitHub Issue Solver with AI"
  homepage "https://git-arbiter.com"
  version "0.1.1-rc.5"
  license "Proprietary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v0.1.1-rc.5/arbiter-macos-arm64"
    sha256 "efe838cf62e57749fc0465c3fe6f955dec712c0b9aa032de7c00a8e03a419beb"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Git-Arbiter/arbiter-releases/releases/download/v0.1.1-rc.5/arbiter-macos-x64"
    sha256 "0b8e42f07dd3482a6df3d5993677b80012dc4c7447d1933a17a8d1c4fa9a3781"
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
