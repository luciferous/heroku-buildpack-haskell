# Heroku Buildpack: Haskell

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks)
for Haskell apps. It uses GHC 7.4.1 and cabal-1.16.0.1.

## Demo

A demo is online here:

http://haskell-buildpack-demo.herokuapp.com/

The demo repo is here:

https://github.com/pufuwozu/haskell-buildpack-demo

## Usage

    $ ls
    Procfile app.cabal src

    $ heroku create --stack=cedar --buildpack https://github.com/pufuwozu/heroku-buildpack-haskell.git

    $ git push heroku master
    ...

    -----> Heroku receiving push
    -----> Fetching custom git buildpack... done
    -----> Haskell app detected
    -----> Downloading GHC
    ######################################################################## 100.0%
    -----> Downloading Cabal
    ######################################################################## 100.0%
    -----> Setting up ghc-pkg
    ...
