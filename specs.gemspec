Gem::Specification.new { |s|
	s.name = "specs"
	s.summary = "Software version information at your fingertips"
	s.description = "See README.md for example usage"

	s.version = 0.2
	s.date = "2013-02-15"

	s.authors = ["Andrew Pennebaker"]
	s.email = "andrew.pennebaker@gmail.com"

	s.executables = ["specs"]

	s.files = Dir["lib/*.rb"] + Dir["lib/aspects/*.rb"] + ["LICENSE.md"]
	s.homepage = "https://github.com/mcandre/specs"
}
