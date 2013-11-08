task :default => 'test'

task :gem => 'specs.gemspec' do
  sh 'gem build specs.gemspec'
  sh 'gem install ./specs-*.gem'
end

task :test => [:clean, :gem] do
  sh 'specs ruby os hardware'
end

task :publish => [:clean, :gem] do
  sh 'gem push ./specs-*.gem'
end

task :reek => [] do
  sh 'bundle exec reek -q .; true'
end

task :flay => [] do
  sh 'bundle exec flay .'
end

task :roodi => [] do
  sh 'bundle exec roodi -config=roodi.yml *.rb **/*.rb'
end

task :cane => [] do
  sh 'bundle exec cane -f *.rb; bundle exec cane **/*.rb'
end

task :excellent => [] do
  sh 'bundle exec excellent .'
end

task :rubocop => [] do
  sh 'bundle exec rubocop'
end

task :tailor => [] do
  sh 'bundle exec tailor'
end

task :lint => [:reek, :flay, :roodi, :cane, :excellent, :rubocop, :tailor] do
end

task :flog => [] do
  sh 'bundle exec flog .'
end

task :churn => [] do
  sh 'bundle exec churn'
end

task :clean => [] do
  begin
    sh 'rm *.gem'
  rescue
  end

  begin
    sh 'rm -rf tmp'
  rescue
  end
end
