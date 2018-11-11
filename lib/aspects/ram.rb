module Recipe
    def self.ram
        if Os.windows?
            'systeminfo | findstr /C:"Total Physical Memory"'
        elsif Os.mac?
            'system_profiler | grep \'Memory:\''
        else
            'grep MemTotal /proc/meminfo'
        end
    end
end
