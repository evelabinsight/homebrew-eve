class Eve < Formula
  desc "CLI tool for controlling Eve devices"
  homepage "https://github.com/meitu/deviceking"
  version "muse_1.0.1.0.0-255-gff243ea2-fast1"
  license "Proprietary"
  depends_on "python@3.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-255-gff243ea2-fast1-macos-arm64.tar.gz"
      sha256 "e02483ff52a90a52654332f7b83f55f69a3e38390f20bd4c54b3447b06d9b511"
    else
      url "https://raw.githubusercontent.com/evelabinsight/homebrew-eve/main/dist/eve-muse_1.0.1.0.0-255-gff243ea2-fast1-macos-x86_64.tar.gz"
      sha256 "b384274410af2755fd8f26128e5053e16ca60830bd67b1bc4a1c8b93887fd758"
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
