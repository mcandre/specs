module Recipe
  module Package
    def self.gem(package)
      "gem list | grep #{package}"
    end
  end

  @bundler = "bundle --version"

  @rubygems = "gem --version"

  @rb = "ruby --version"

  @ruby = [@bundler, @rubygems, @rb]
end
