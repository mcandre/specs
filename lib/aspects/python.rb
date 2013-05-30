module Recipe
  def self.pip
    "pip --version"
  end

  def self.py
    "python --version"
  end

  def self.python
    [pip, py]
  end
end
