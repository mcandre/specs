module Recipe
    module Package
        def self.pip(package)
            "pip list | grep #{package}"
        end
    end

    def self.pip
        'pip --version'
    end

    def self.py
        'python --version'
    end

    def self.python
        [pip, py]
    end
end
