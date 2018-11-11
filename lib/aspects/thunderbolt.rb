module Recipe
    def self.thunderbolt
        if Os.mac?
            'system_profiler | grep \'Thunderbolt Version\' | head -n 1'
        end
    end
end
