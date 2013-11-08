module Recipe
  def self.mvn
    'mvn --version'
  end

  def self.classpath
    if Os.windows? && !Os.mingw?
      'echo %CLASSPATH'
    else
      'echo $CLASSPATH'
    end
  end

  def self.javahome
    if Os.windows? && !Os.mingw?
      'echo %JAVA_HOME%'
    else
      'echo $JAVA_HOME'
    end
  end

  def self.oak
    'java -version'
  end

  def self.oakc
    'javac -version'
  end

  def self.java
    [mvn, classpath, javahome, oakc, oak]
  end
end
