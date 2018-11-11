module Recipe
    def self.nodejs
        'node --version'
    end

    def self.node
        [npm, nodejs]
    end
end
