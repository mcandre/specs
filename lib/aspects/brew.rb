module Recipe
  module Package
    def self.brew(package)
      "brew list #{package}"
    end
  end
end
