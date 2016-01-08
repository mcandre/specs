require './lib/version'

Gem::Specification.new { |s|
  s.name = 'specs'
  s.summary = 'Software version information at your fingertips'
  s.description = 'See README.md for example usage'
  s.license = 'FreeBSD'

  s.version = Specs::VERSION

  s.authors = ['Andrew Pennebaker']
  s.email = 'andrew.pennebaker@gmail.com'

  s.executables = ['specs']

  s.files = Dir['lib/*.rb'] + Dir['lib/aspects/*.rb'] + ['LICENSE.md']
  s.homepage = 'https://github.com/mcandre/specs'

  s.required_ruby_version = '>= 2.0'

  s.add_dependency 'rb-system-with-aliases', '~> 0.2'
  s.add_dependency 'docopt', '~> 0.5'
  s.add_dependency 'contracts', '0.7'

  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'reek', '~> 1.3'
  s.add_development_dependency 'flay', '~> 2.5'
  s.add_development_dependency 'flog', '~> 4.3'
  s.add_development_dependency 'roodi', '~> 4.0'
  s.add_development_dependency 'churn', '~> 1.0'
  s.add_development_dependency 'cane', '~> 2.6'
  s.add_development_dependency 'excellent', '~> 2.1'
  s.add_development_dependency 'rubocop', '~> 0.25'
  s.add_development_dependency 'tailor', '~> 1.4'
  s.add_development_dependency 'guard', '~> 2.6'
  s.add_development_dependency 'guard-shell', '~> 0.6'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'cucumber', '~> 1.3'
  s.add_development_dependency 'aspelllint', '~> 0.10'
  s.add_development_dependency 'cowl', '~> 0.2'
  s.add_development_dependency 'lili', '~> 0.2'
}
