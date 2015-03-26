module Recipe
  module Package
    def self.brew(package)
      "brew info #{package} 2>&1 | head -n 1"
    end
  end
end
