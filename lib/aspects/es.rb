module Recipe
    def self.es
        'curl -s http://localhost:9200/ | grep number'
    end
end
