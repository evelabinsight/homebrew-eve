class Eve < Formula
  desc "CLI tool for controlling Eve devices"
  homepage "https://github.com/meitu/deviceking"
  version "muse_1.0.1.0.0-227-g9f685382-log2"
  license "Proprietary"
  depends_on "python@3.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-227-g9f685382-log2-macos-arm64.tar.gz"
      sha256 "d69f029729656bc4dfe54ac7bac074a330890c0e249d6fb5fd15dccc733e6ed0"
    else
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-227-g9f685382-log2-macos-x86_64.tar.gz"
      sha256 "60d1f9526aa5dc972e0373b767a7919f00c8476c9cefe049287d607f210f0642"
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
