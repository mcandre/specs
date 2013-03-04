module Recipe
  def self.cabal
    "cabal --version"
  end

  def self.ghc
    "ghc --version"
  end

  def self.haskellplatform
    "ghc-pkg field haskell-platform version"
  end

  def self.haskell
    [
     cabal,
     ghc,
     haskellplatform
    ]
  end
end
