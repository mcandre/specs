module Recipe
	def Recipe.shell
		if Os.windows?
			"echo %cmdextversion%"
		elsif Os.unix?
			"sh --version"
		end
	end
end