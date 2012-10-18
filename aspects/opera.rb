module Recipe
	def Recipe.opera
		# Assumes opera in PATH.
		if Os.unix? and not Os.mac?
			"opera -version"
		# Opera for Mac/Windows does not support the -version command line option.
		# # Assumes Opera is installed in the default directory.
		# elsif Os.mac?
		# 	"/Applications/Opera.app/Contents/MacOS/Opera -version"
		# elsif Os.windows?
		# 	"C:\\Program Files (x86)\\Opera\\opera -version"
		end
	end
end