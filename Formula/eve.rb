class Eve < Formula
  desc "CLI tool for controlling Eve devices"
  homepage "https://github.com/meitu/deviceking"
  version "muse_1.0.1.0.0-225-ge336b428-dirty"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/Wuhualiang123/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-225-ge336b428-dirty-macos-arm64.tar.gz"
      sha256 "93edec4621d12b6a32de91714a194b20b0062686ca9ec3bd2f14ce4485ec2fca"
    else
      url "https://raw.githubusercontent.com/Wuhualiang123/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-225-ge336b428-dirty-macos-x86_64.tar.gz"
      sha256 "276c8417661bbe407e610a168da6af1a66b151123b7a8fdd841fdacc06f6a126"
    end
  end

  def install
    bin.install "eve"
  end

  test do
    assert_match "Eve 设备控制工具", shell_output("#{bin}/eve --help")
  end
end
