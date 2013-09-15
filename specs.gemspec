Gem::Specification.new { |s|
  s.name = "specs"
  s.summary = "Software version information at your fingertips"
  s.description = "See README.md for example usage"
  s.license = "FreeBSD"

  s.version = 0.4
  s.date = "2013-03-23"

  s.authors = ["Andrew Pennebaker"]
  s.email = "andrew.pennebaker@gmail.com"

  s.executables = ["specs"]

  s.files = Dir["lib/*.rb"] + Dir["lib/aspects/*.rb"] + ["LICENSE.md"]
  s.homepage = "https://github.com/mcandre/specs"

  s.add_development_dependency "rake"
  s.add_development_dependency "reek"
  s.add_development_dependency "flay"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-shell"
}
