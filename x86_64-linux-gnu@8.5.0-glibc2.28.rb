class CpuRequirement < Requirement
    fatal true
  
    satisfy() { Hardware::CPU.arm? }
  
    def message
      "Only apple silicon supported!"
    end
  end

class X8664LinuxGnuAT850Glibc228 < Formula
    desc "x86_64 Linux GNU Toolchain For Apple Sillicon MacOS"
    homepage "https://github.com/meowlgmee/homebrew-macos-cross-toolchains"
    license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
    version "8.5.0"
    revision 1

    on_macos do
        depends_on CpuRequirement
    end
  
    url "https://github.com/meowlgmee/homebrew-macos-cross-toolchains/releases/download/v8.5.0-glibc2.28-x86_64/x86_64-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "a069c11ab31bbce83f78c4a5bf4a4c7f501e3e875e321abe90443df9035beac3"
  
    def install
      (prefix/"toolchain").install Dir["./*"]
      Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
    end
  end
