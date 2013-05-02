module Recipe
  def self.redis_cli
    "redis-cli --version"
  end

  def self.redis_server
    "redis-server --version"
  end

  def self.redis
    [redis_cli, redis_server]
  end
end
