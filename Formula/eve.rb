class Eve < Formula
  desc "CLI tool for controlling Eve devices"
  homepage "https://github.com/meitu/deviceking"
  version "muse_1.0.1.0.0-227-g9f685382-log1"
  license "Proprietary"
  depends_on "python@3.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-227-g9f685382-log1-macos-arm64.tar.gz"
      sha256 "46aeebbeb6da02ed5a797f5067067897a17becb82eb273c14bd982473f899d6d"
    else
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-227-g9f685382-log1-macos-x86_64.tar.gz"
      sha256 "cc8177a42241eeabd1961ef4db2bf27ad8bc42a3bd282c2000f49d26b730aab1"
    end
  end

  def install
    libexec.install Dir["*"]
    python = Formula["python@3.11"].opt_bin/"python3.11"
    (bin/"eve").write <<~EOS
      #!/bin/bash
      export EVE_PYTHON="#{python}"
      exec "#{python}" "#{libexec}/eve" "$@"
    EOS
    chmod 0755, bin/"eve"
  end

  test do
    assert_match "Eve 设备控制工具", shell_output("#{bin}/eve --help")
  end
end
