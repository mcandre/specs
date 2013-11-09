module Recipe
  def self.pear
    'pear version'
  end

  def self.ph
    'php --version'
  end

  def self.php
    [pear, ph]
  end
end
