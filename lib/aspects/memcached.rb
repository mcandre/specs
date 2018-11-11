module Recipe
    def self.memcached
        'echo version | nc localhost 11211'
    end
end
