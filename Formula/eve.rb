class Eve < Formula
  desc "CLI tool for controlling Eve devices"
  homepage "https://github.com/meitu/deviceking"
  version "muse_1.0.1.0.0-257-gfd8e2402-fast1"
  license "Proprietary"
  depends_on "python@3.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-257-gfd8e2402-fast1-macos-arm64.tar.gz"
      sha256 "0c329d8fc0b7aa37ca1ae9b5ad4e7f958af44b1f5ef9ef98852e271a24190e5a"
    else
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-257-gfd8e2402-fast1-macos-x86_64.tar.gz"
      sha256 "d974189b43dbbb24660889fa3330d5a89db6f8ed53d8217056c67b1325d528ba"
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
