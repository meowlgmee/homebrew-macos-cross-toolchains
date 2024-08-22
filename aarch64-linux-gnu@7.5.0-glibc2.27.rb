class CpuRequirement < Requirement
    fatal true
  
    satisfy() { Hardware::CPU.arm? }
  
    def message
      "Only apple silicon supported!"
    end
  end

class Aarch64LinuxGnuAT750Glibc227 < Formula
    desc "aarch64 Linux GNU Toolchain"
    homepage "https://github.com/meowlgmee/homebrew-macos-cross-toolchains"
    license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
    version "7.5.0"
    revision 1

    on_macos do
        depends_on CpuRequirement
    end
  
    url "https://github.com/meowlgmee/homebrew-macos-cross-toolchains/releases/download/v7.5.0-glibc2.27/aarch64-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "1a4b06a53139ba65930a778d66a7f885d52f4ddc739c99fb6c6febc9a3f18163"
  
    def install
      (prefix/"toolchain").install Dir["./*"]
      Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
    end
  end
