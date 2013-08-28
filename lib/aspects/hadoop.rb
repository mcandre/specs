module Recipe
  def self.hadoophome
    if Os.windows? and not Os.mingw?
      "echo %HADOOP_PREFIX%"
    else
      "echo $HADOOP_PREFIX"
    end
  end

  def self.hadoopversion
    if Os.windows? and not Os.mingw?
      "echo %HADOOP_VERSION%"
    else
      "echo $HADOOP_VERSION"
    end
  end

  def self.hadoopcommand
    "hadoop version"
  end

  def self.hadoop
    [hadoophome, hadoopversion, hadoopcommand]
  end
end
