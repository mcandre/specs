module Recipe
  def self.scalac
    "scalac -version"
  end

  def self.sbt
    "sbt sbt-version"
  end

  def self.scala
    [sbt, scalac, java]
  end
end
