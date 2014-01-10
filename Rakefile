task :default => 'test'

task :gem => 'specs.gemspec' do
  sh 'gem build *.gemspec'
end

task :install => [:gem] do
  sh 'gem install ./*.gem'
end

task :test => [:clean, :install] do
  sh 'specs ruby os hardware'
end

task :publish => [:clean, :gem] do
  sh 'gem push ./*.gem'
end

task :ruby => [] do
  begin
    sh 'for f in **/*.rb; do ruby -wc $f 2>&1 | grep -v "Syntax OK" | grep -v "ssl.rb"; done'
  rescue
  end
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
  sh 'bundle exec rubocop **/*.rb **/*.erb **/Guardfile*'
end

task :tailor => [] do
  sh 'bundle exec tailor'
end

task :lint => [:ruby, :reek, :flay, :roodi, :cane, :excellent, :rubocop, :tailor] do
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
