#!/bin/sh

# libgmp hack
mkdir -p $HOME/usr/lib
ln -s /usr/lib/libgmp.so.3 $HOME/usr/lib/libgmp.so

# ghc
curl --silent http://www.haskell.org/ghc/dist/7.4.1/ghc-7.4.1-x86_64-unknown-linux.tar.bz2|tar xj
cd ghc-7.4.1/
./configure --prefix=$HOME/ghc --with-gmp-libraries=$HOME/usr/lib
make install
cd ..

# ldconfig for linker hack
$HOME/ghc/bin/ghc-pkg describe base > base.package.conf
sed -i "s/ld-options:/ld-options:\ -L\/app\/usr\/lib/" base.package.conf
$HOME/ghc/bin/ghc-pkg update base.package.conf

# haskell-platform (disabled because it requires opengl)
#curl --silent http://lambda.haskell.org/platform/download/2011.4.0.0/haskell-platform-2011.4.0.0.tar.gz|tar xz
#cd haskell-platform-2011.4.0.0/

# cabal
curl --silent http://www.haskell.org/cabal/release/cabal-1.14.0/Cabal-1.14.0.tar.gz|tar xz
cd Cabal-1.14.0/
$HOME/ghc/bin/ghc --make Setup
./Setup configure --user --with-ghc=$HOME/ghc/bin/ghc
./Setup build
./Setup install
cd ..

# cabal-install
curl --silent http://www.haskell.org/cabal/release/cabal-install-0.14.0/cabal-install-0.14.0.tar.gz|tar xz
cd cabal-install-0.14.0/
PATH=$PATH:$HOME/ghc/bin sh bootstrap.sh
cd ..

tar cvzf ghc.tar.gz ghc
tar cvzf cabal.tar.gz .cabal
