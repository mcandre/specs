module Recipe
  def self.hadoophome
    if Os.windows?
      "echo %HADOOP_PREFIX%"
    else
      "echo $HADOOP_PREFIX"
    end
  end

  def self.hadoopv
    "hadoop version"
  end

  def self.hadoop
    [hadoophome, hadoopv]
  end
end
