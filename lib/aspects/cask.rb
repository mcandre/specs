module Recipe
  module Package
    def self.cask(package)
      "find #{$ENV['HOME']}/.emacs.d/.cask -type d -name #{package}"
    end
  end
end
