module Recipe
    module Package
        def self.dpkg(package)
            "dpkg -l #{package}"
        end

        def self.apt(package)
            self.dpkg(package)
        end
    end
end
