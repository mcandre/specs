module Recipe
  module Package
    def self.pip3(package)
      "pip3 list | grep #{package}"
    end
  end

  def self.pip3
    'pip3 --version'
  end

  def self.py3
    'python3 --version'
  end

  def self.python3
    [pip3, py3]
  end
end
