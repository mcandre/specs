module Recipe
  module Package
    def self.cabal(package)
      "ghc-pkg list #{package}"
    end
  end

  def self.cabal
    'cabal --version'
  end

  def self.ghc
    'ghc --version'
  end

  def self.haskellplatform
    'ghc-pkg field haskell-platform version'
  end

  def self.haskell
    [cabal, ghc, haskellplatform]
  end
end
