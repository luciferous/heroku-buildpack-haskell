# Heroku Buildpack: Haskell

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks)
for Haskell apps. It uses GHC 7.4.1 and cabal-1.16.0.1.

I build this new version of the buildpack to run a slighty newer Yesod version than 1.1.2; currently I only tested it with yesod-1.1.9.

## Usage

    $ ls
    Procfile app.cabal src

    $ heroku create --stack=cedar --buildpack https://github.com/ichistmeinname/heroku-buildpack-haskell.git

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
