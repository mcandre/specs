module Recipe
    def self.kafka
        if Os.mac?
            [Package::brew('kafka')]
        end
    end
end
