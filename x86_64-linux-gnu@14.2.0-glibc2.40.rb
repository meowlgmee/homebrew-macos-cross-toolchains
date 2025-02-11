class CpuRequirement < Requirement
    fatal true
  
    satisfy() { Hardware::CPU.arm? }
  
    def message
      "Only apple silicon supported!"
    end
  end

class X8664LinuxGnuAT1420Glibc240 < Formula
    desc "x86_64 Linux GNU Toolchain For Apple Sillicon MacOS"
    homepage "https://github.com/meowlgmee/homebrew-macos-cross-toolchains"
    license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
    version "14.2.0"
    revision 1

    on_macos do
        depends_on CpuRequirement
    end
  
    url "https://github.com/meowlgmee/homebrew-macos-cross-toolchains/releases/download/v14.2.0-glibc2.40-x86_64/x86_64-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "95eb3d1fb5764b6e571c18460af709c01e9549597ac927a6f28ef022e45fc438"
  
    def install
      (prefix/"toolchain").install Dir["./*"]
      Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
    end
  end
