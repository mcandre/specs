module Recipe
    module Package
        def self.opam(package)
            "opam list #{package}"
        end
    end

    def self.ocamlc
        'ocamlc -version'
    end

    def self.opam
        'opam --version'
    end

    def self.ocaml
        [ocamlc, opam]
    end
end
