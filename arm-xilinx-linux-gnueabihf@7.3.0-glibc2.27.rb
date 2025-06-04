class CpuRequirement < Requirement
    fatal true
  
    satisfy() { Hardware::CPU.arm? }
  
    def message
      "Only apple m1/m2 supported!"
    end
  end

class ArmXilinxLinuxGnueabihfAT730Glibc227 < Formula
    desc "Arm Linux GNU Toolchain (Hardward Float Point)"
    homepage "https://github.com/meowlgmee/homebrew-macos-cross-toolchains"
    license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
    version "7.3.0"
    revision 1

    on_macos do
        depends_on CpuRequirement
    end
  
    url "https://github.com/meowlgmee/homebrew-macos-cross-toolchains/releases/download/v7.3.0-glibc2.27-armv7/arm-xilinx-linux-gnueabihf-v7.3.0-host-aarch64-darwin.tar.gz"
    sha256 "e15c099750b92c2d2e85007a86cbe878dff5d0f32b2a26fae011247e269280de"
  
    def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
    end
  end
