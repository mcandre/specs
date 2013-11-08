require "./lib/version"

Gem::Specification.new { |s|
  s.name = "specs"
  s.summary = "Software version information at your fingertips"
  s.description = "See README.md for example usage"
  s.license = "FreeBSD"

  s.version = Specs::VERSION
  s.date = "2013-03-23"

  s.authors = ["Andrew Pennebaker"]
  s.email = "andrew.pennebaker@gmail.com"

  s.executables = ["specs"]

  s.files = Dir["lib/*.rb"] + Dir["lib/aspects/*.rb"] + ["LICENSE.md"]
  s.homepage = "https://github.com/mcandre/specs"

  s.add_dependency "contracts"

  s.add_development_dependency "rake"
  s.add_development_dependency "reek"
  s.add_development_dependency "flay"
  s.add_development_dependency "flog"
  s.add_development_dependency "roodi"
  s.add_development_dependency "churn"
  s.add_development_dependency "cane"
  s.add_development_dependency "excellent"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "tailor"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-shell"
}
