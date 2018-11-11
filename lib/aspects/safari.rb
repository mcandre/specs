module Recipe
    def self.safari
        if Os.mac?
            'system_profiler SPApplicationsDataType | grep \'Safari:\' -A 2'
        end
    end
end
