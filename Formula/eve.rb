class Eve < Formula
  desc "CLI tool for controlling Eve devices"
  homepage "https://github.com/meitu/deviceking"
  version "muse_1.0.1.0.0-255-gff243ea2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-255-gff243ea2-macos-arm64.tar.gz"
      sha256 "a1a889cc23e13f0cc5f97862dc5b6a84a0aec77d92ef29125b8fe2adb2c78445"
    else
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-255-gff243ea2-macos-x86_64.tar.gz"
      sha256 "2030e68f654a7d4ab213999e90a78b115d0afbd4fc970903f516078544f3223d"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"eve"
  end

  test do
    assert_match "Eve 设备控制工具", shell_output("#{bin}/eve --help")
  end
end
