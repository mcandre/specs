require "./lib/specs"

task :default => "test"

task :gem => "specs.gemspec" do
  sh "gem build specs.gemspec"
  sh "gem install ./specs-#{SPECS_VERSION}.gem"
end

task :test => [:gem] do
  sh "specs ruby os hardware"
end

task :publish => [:gem] do
  sh "gem push ./specs-#{SPECS_VERSION}.gem"
end

task :clean => [] do
  sh "rm *.gem"
end
