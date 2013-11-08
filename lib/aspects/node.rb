module Recipe
  module Package
    def self.npm(package)
      "npm list #{package}"
    end
  end

  def self.npm_tool
    'npm --version'
  end

  def self.js
    'node --version'
  end

  def self.node
    [npm_tool, js]
  end
end
