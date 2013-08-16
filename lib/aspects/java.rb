module Recipe
  def self.mvn
    "mvn --version"
  end

  def self.oak
    "java -version"
  end

  def self.java
    [mvn, oak]
  end
end
