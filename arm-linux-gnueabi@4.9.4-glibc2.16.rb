class CpuRequirement < Requirement
    fatal true
  
    satisfy() { Hardware::CPU.arm? }
  
    def message
      "Only apple m1/m2 supported!"
    end
  end

class ArmLinuxGnueabiAT494Glibc216 < Formula
    desc "aarch64 Linux GNU Toolchain"
    homepage "https://github.com/nexbeam/homebrew-macos-cross-toolchains"
    license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
    version "4.9.4"
    revision 1

    on_macos do
        depends_on CpuRequirement
    end
  
    url "https://github.com/nexbeam/homebrew-macos-cross-toolchains/releases/download/v4.9.4-glibc2.16/arm-linux-gnueabi-aarch64-darwin.tar.gz"
    sha256 "86f7fac6613a1a2abe3c60694ceccacad5745ba042bafd25d834407fbda95e65"
  
    def install
      (prefix/"toolchain").install Dir["./*"]
      Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
    end
  end