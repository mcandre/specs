module Recipe
	def Recipe.net
		if Os.windows?
			"ipconfig /all"
		# Assumes Unix
		else
			"ifconfig -a"
		end
	end
end