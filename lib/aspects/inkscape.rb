module Recipe
  def self.inkscape
    # Assumes Inkscape is installed in default directory.
    if Os.windows?
      if Os.x86_64?
        "C:\\Program Files (x86)\\Inkscape\\inkscape --version"
      else
        "\"C:\\Program Files\\Inkscape\\inkscape\" --version"
      end
    elsif Os.mac?
      "/Applications/Inkscape.app/Contents/Resources/bin/inkscape --version"
      # Assumes:
      # * OS is a Unix variant.
      # * inkscape is in PATH.
    else
      "inkscape --version"
    end
  end
end
