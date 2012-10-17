module Perl
	def Perl.command
		[
			"ppm --version 2>&1", # Redirect stderr to stdout
			"cpan --version",
			"perl --version"
		]
	end
end