class CpuRequirement < Requirement
    fatal true
  
    satisfy() { Hardware::CPU.arm? }
  
    def message
      "Only apple m1/m2 supported!"
    end
  end

class ArmXilinxLinuxGnueabiAT730Glibc227 < Formula
    desc "aarch64 Linux GNU Toolchain"
    homepage "https://github.com/meowlgmee/homebrew-macos-cross-toolchains"
    license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
    version "7.3.0"
    revision 1

    on_macos do
        depends_on CpuRequirement
    end
  
    url "https://github.com/meowlgmee/homebrew-macos-cross-toolchains/releases/download/v7.3.0-glibc2.27-armv7/arm-xilinx-linux-gnueabi-v7.3.0-host-aarch64-darwin.tar.gz"
    sha256 "ac31f7d612158ba566b235d54e3ddbbb7390ec93ad37246e4fd64503a4a25216"
  
    def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
    end
  end
