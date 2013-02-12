module Recipe
	def self.xcode
		if Os.mac?
			"xcodebuild -version"
		end
	end
end