module Recipe
	def Recipe.ppm
		"ppm --version"
	end

	def Recipe.cpan
		"cpan --version"
	end

	def Recipe.pl
		"perl --version"
	end

	def Recipe.perl
		[ppm, cpan, pl]
	end
end