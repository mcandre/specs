module Recipe
    def self.latex
        if Os.unix?
            'pdflatex --version'
        end
    end
end
