module Recipe
	def Recipe.rubygems
		"gem --version"
	end

	def Recipe.rb
		"ruby --version"
	end

	def Recipe.ruby
		[
			rubygems,
			rb
		]
	end
end