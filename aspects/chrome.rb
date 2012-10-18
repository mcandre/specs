module Recipe
	def Recipe.chrome
		# Assumes Chrome installed in default directory.
		if Os.mac?
			"/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome --version 2>&1 | grep -v Unsure" # Redirect stderr to stdout
		elsif Os.windows?
			"%UserProfile%\\AppData\\Local\\Google\\Chrome\\Application\\chrome --version"
		# Assumes
		# * binary is google-chrome.
		# * binary is in PATH.
		else
			"google-chrome --version"
		end
	end
end