module Inkscape
	def Inkscape.command
		# Assumes Inkscape is installed in default directory.
		if Os.windows?
			"C:\\Program Files (x86)\\Inkscape\\inkscape --version"
		elsif Os.mac?
			"/Applications/Inkscape.app/Contents/Resources/bin/inkscape --version"
		# Assumes:
		# * OS is a Unix variant.
		# * inkscape is in PATH.
		else
			"inkscape --version"
		end
	end
end