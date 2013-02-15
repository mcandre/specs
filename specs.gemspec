Gem::Specification.new { |s|
	s.name = "specs"
	s.summary = "Software version information at your fingertips"
	s.description = "See README.md for example usage"

	s.version = 0.2
	s.date = "2013-02-15"

	s.authors = ["Andrew Pennebaker"]
	s.email = "andrew.pennebaker@gmail.com"

	s.executables = ["specs"]

	s.files = [
		"lib/specs.rb",
		"lib/aspects/as.rb",
		"lib/aspects/bios.rb",
		"lib/aspects/chocolatey.rb",
		"lib/aspects/chrome.rb",
		"lib/aspects/cpu.rb",
		"lib/aspects/firefox.rb",
		"lib/aspects/hardware.rb",
		"lib/aspects/inkscape.rb",
		"lib/aspects/latex.rb",
		"lib/aspects/ld.rb",
		"lib/aspects/lua.rb",
		"lib/aspects/net.rb",
		"lib/aspects/node.rb",
		"lib/aspects/opera.rb",
		"lib/aspects/perl.rb",
		"lib/aspects/powershell.rb",
		"lib/aspects/ram.rb",
		"lib/aspects/ruby.rb",
		"lib/aspects/shell.rb",
		"lib/aspects/virtualbox.rb",
		"lib/aspects/xcode.rb",
		"LICENSE.md"
	]

	s.homepage = "https://github.com/mcandre/specs"
}
