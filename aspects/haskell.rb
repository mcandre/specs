module Recipe
	def Recipe.cabal
		"cabal --version"
	end

	def Recipe.ghc
		"ghc --version"
	end

	def Recipe.haskellplatform
		"ghc-pkg field haskell-platform version"
	end

	def Recipe.haskell
		[
			cabal,
			ghc,
			haskellplatform
		]
	end
end