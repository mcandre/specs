module Recipe
	def Recipe.xcode
		if Os.mac?
			"xcodebuild -version"
		end
	end
end