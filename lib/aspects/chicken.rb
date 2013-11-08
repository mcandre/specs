module Recipe
  def self.eggs
    'chicken-install -version'
  end

  def self.csi
    'csi -version'
  end

  def self.csc
    'csc -version'
  end

  def self.chicken
    [eggs, csi]
  end
end
