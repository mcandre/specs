module Recipe
  def self.mvn
    "mvn --version"
  end

  def self.classpath
    if Os.windows?
      "echo %CLASSPATH"
    else
      "echo $CLASSPATH"
    end
  end

  def self.javahome
    if Os.windows?
      "echo %JAVA_HOME%"
    else
      "echo $JAVA_HOME"
    end
  end

  def self.oak
    "java -version"
  end

  def self.java
    [mvn, classpath, javahome, oak]
  end
end
