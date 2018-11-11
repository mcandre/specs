require_relative 'apt'

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
        if Os.linux?
            Package.apt('haskell-platform')
        else
            'ghc-pkg field haskell-platform version'
        end
    end

    def self.haskell
        if Os.mac?
            [cabal, ghc]
        else
            [cabal, ghc, haskellplatform]
        end
    end
end
