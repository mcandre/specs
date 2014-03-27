module Recipe
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
