module Recipe
  def self.lein
    "lein --version"
  end

  def self.clj
    "clj -e '(println \"Clojure \" (clojure-version))'"
  end

  def self.clojure
    [clj, lein]
  end
end