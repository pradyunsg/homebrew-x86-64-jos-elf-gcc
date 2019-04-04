class X8664JosElfGdb < Formula
  homepage "http://pdos.csail.mit.edu/6.828/2014/tools.html"
  url "http://ftpmirror.gnu.org/gdb/gdb-7.3.1.tar.bz2"
  sha256 "6d7bff716fde98d03866a1b747c0929ee7dba49bca13e01d975e0b0fa9b33a28"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=x86-64-jos-elf",
                          "--program-prefix=x86-64-jos-elf-",
                          "--disable-nls",
                          "--disable-werror"
    system "make", "all"
    system "make", "install"
    # avoid conflict with binutil
    if Formula["x86-64-jos-elf-binutils"].installed?
      rm_r share/"info"
      rm_r lib
    end
  end

  test do
    system "#{bin}/x86-64-jos-elf-gdb -v"
  end
end
