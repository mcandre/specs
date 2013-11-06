task :default => "test"

task :gem => "specs.gemspec" do
  sh "gem build specs.gemspec"
  sh "gem install ./specs-*.gem"
end

task :test => [:clean, :gem] do
  sh "specs ruby os hardware"
end

task :publish => [:clean, :gem] do
  sh "gem push ./specs-*.gem"
end

task :lint => [] do
  sh "bundle exec reek -q .; true"
  sh "bundle exec flay ."
  sh "bundle exec flog ."
end

task :clean => [] do
  begin
    sh "rm *.gem"
  rescue
  end
end
