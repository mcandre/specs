module Recipe
  def self.scalac
    "scalac -version"
  end

  def self.scala
    [scalac, java]
  end
end
