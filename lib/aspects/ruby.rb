module Recipe
  def self.rubygems
    "gem --version"
  end

  def self.rb
    "ruby --version"
  end

  def self.ruby
    [rubygems, rb]
  end
end
