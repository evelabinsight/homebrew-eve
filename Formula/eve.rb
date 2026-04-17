class Eve < Formula
  desc "CLI tool for controlling Eve devices"
  homepage "https://github.com/meitu/deviceking"
  version "muse_1.0.1.0.0-224-g09370a2d-dirty"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      odie "No arm64 package has been published for eve yet."
    else
      url "https://raw.githubusercontent.com/Wuhualiang123/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-224-g09370a2d-dirty-macos-x86_64.tar.gz"
      sha256 "5b488e670cbfc9cd2f249a7851819ba6666da3d588474cc1c9c9bc7f0c302bff"
    end
  end

  def install
    bin.install "eve"
  end

  test do
    assert_match "Eve 设备控制工具", shell_output("#{bin}/eve --help")
  end
end
