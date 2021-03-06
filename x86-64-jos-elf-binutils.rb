class X8664JosElfBinutils < Formula
  homepage "http://pdos.csail.mit.edu/6.828/2014/tools.html"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.21.1.tar.bz2"
  sha256 "cdecfa69f02aa7b05fbcdf678e33137151f361313b2f3e48aba925f64eabf654"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=x86_64-elf",
                          "--program-prefix=x86_64-elf-",
                          "--disable-werror",
                          "--disable-nls"
    system "make"
    system "make", "install"
    # avoid conflict with gdb
    if Formula["x86-64-jos-elf-gdb"].installed?
      rm_r share/"info"
      rm_r lib
    end
  end

  test do
    system "#{bin}/x86-64-jos-elf-objdump -i"
  end
end
