module Recipe
  def self.dockerv
    'docker version'
  end

  def self.boot2docker
    'boot2docker version'
  end

  def self.docker
    if Os.linux?
      [dockerv]
    else
      [dockerv, boot2docker, 'vagrant --version', virtualbox]
    end
  end
end
