# Note that this script can accept some limited command-line arguments, run
# `julia build_tarballs.jl --help` to see a usage message.
using BinaryBuilder

name = "CouenneBuilder"
version = v"0.1.0"

# Collection of sources required to build CouenneBuilder
sources = [
    "https://github.com/ampl/coin/archive/v20170826.tar.gz" =>
    "b3c7395c22552614107161e1672c232a4fce4effca409863814a7fe623997651",

]

# Bash recipe for building across all platforms
script = raw"""
cd $WORKSPACE/srcdir/coin-20170826/
cmake -DCMAKE_INSTALL_PREFIX=$prefix -DCMAKE_TOOLCHAIN_FILE=/opt/$target/$target.toolchain -DBUILD_SHARED_LIBS=ON .
make
make install

# cd Bonmin/
# ./configure --prefix=$prefix --host=$target

mkdir -p $prefix/bin
install bin/* $prefix/bin/

"""

# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = [
    FreeBSD(:x86_64),
    Linux(:x86_64, :glibc),
    MacOS(:x86_64)
]

# The products that we will ensure are always built
products(prefix) = [
    LibraryProduct(prefix, "libCbcSolver", :libCbcSolver),
    LibraryProduct(prefix, "libipopt", :libipopt),
    LibraryProduct(prefix, "libOsi", :libOsi),
#    ExecutableProduct(prefix, ""),
    LibraryProduct(prefix, "libCoinUtils", :libCoinUtils),
    LibraryProduct(prefix, "libCgl", :libCgl),
    LibraryProduct(prefix, "libOsiCbc", :libOsiCbc),
    LibraryProduct(prefix, "libOsiCommonTests", :libOsiCommonTests),
#    ExecutableProduct(prefix, ""),
    LibraryProduct(prefix, "libCouenne", :libCouenne),
    LibraryProduct(prefix, "libOsiClp", :libOsiClp),
    LibraryProduct(prefix, "libbonmin", :libbonmin),
    LibraryProduct(prefix, "libCbc", :libCbc),
    LibraryProduct(prefix, "libClp", :libClp)
]

# Dependencies that must be installed before this package can be built
dependencies = [
    
]

# Build the tarballs, and possibly a `build.jl` as well.
build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies)

