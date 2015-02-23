module Recipe
  module Package
    def self.npm(package)
      "npm list #{package}"
    end
  end

  def self.npm
    'npm --version'
  end
end
