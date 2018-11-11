module Recipe
    def self.iojs_v
        'iojs --version'
    end

    def self.iojs
        [npm, iojs_v]
    end
end
