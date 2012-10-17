module Haskell
	def Haskell.command
		[
			"cabal --version",
			"ghc --version",
			"ghc-pkg field haskell-platform version"
		]
	end
end