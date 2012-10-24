module Recipe
	def Recipe.latex
		if Os.unix?
			"pdflatex --version"
		end
	end
end