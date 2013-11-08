module Recipe
  module Package
    def self.gem(package)
      "gem list | grep #{package}"
    end
  end

  def self.bundler
    'bundle --version'
  end

  def self.rubygems
    'gem --version'
  end

  def self.rb
    'ruby --version'
  end

  def self.ruby
    [bundler, rubygems, rb]
  end
end
