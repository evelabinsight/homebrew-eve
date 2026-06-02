class Eve < Formula
  desc "CLI tool for controlling Eve devices"
  homepage "https://github.com/meitu/deviceking"
  version "muse_1.0.1.0.0-260-g13fd9abf-fast1"
  license "Proprietary"
  depends_on "python@3.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-260-g13fd9abf-fast1-macos-arm64.tar.gz"
      sha256 "73a0a84bfafc9b017daec9b91498dcfb9e3db4eb4a9d008024ff7790917de8f7"
    else
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-260-g13fd9abf-fast1-macos-x86_64.tar.gz"
      sha256 "55d884b7afd66b909f798dccbc8b5ba3ceddaf2d0f9b13e3908892d66d6a92a4"
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
