module Xcode
	def Xcode.command
		if Os.mac?
			"xcodebuild -version"
		end
	end
end