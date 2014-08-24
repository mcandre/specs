module Recipe
  module Package
    def self.cask(package)
      "find ~/.emacs.d/.cask -name '*#{package}*' | head -n 1"
    end
  end

  def self.emacs
    'emacs --version'
  end
end
