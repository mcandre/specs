module Recipe
    def self.redis_cli
        'redis-cli --version'
    end

    def self.redis_server
        'redis-server --version'
    end

    def self.redis
        # In Windows, Redis server is provided as a service
        # instead of a CLI program.
        if Os.windows?
            redis_cli
        else
            [redis_cli, redis_server]
        end
    end
end
