class Aarch64LinuxGnu < Formula
    desc "aarch64 Linux GNU Toolchain"
    homepage "https://github.com/bytecellar/homebrew-macos-cross-toolchains"
    license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
    version "8.5.0"
    revision 1

    on_macos do
        depends_on Hardware::CPU.arm?
    end
  
    url "https://github.com/bytecellar/homebrew-macos-cross-toolchains/releases/download/v8.5.0-glibc2.28/aarch64-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "45be5efafe5504be307101360e631c1f4000e50af4e8d93fa01f8f59fa3bfce8"
  
    def install
      (prefix/"toolchain").install Dir["./*"]
      Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
    end
  end