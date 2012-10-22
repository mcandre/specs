module Recipe
	def Recipe.mactex
		if Os.mac?
			"which pdflatex"
		end
	end

	def Recipe.pdflatex
		if Os.unix?
			"pdflatex --version"
		end
	end

	def Recipe.latex
		if Os.mac?
			[mactex, pdflatex]
		end
	end
end