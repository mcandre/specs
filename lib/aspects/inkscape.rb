module Recipe
  def self.inkscape
    case Os.os_name
    when :windows
      if Os.x86_64?
        'C:\\Program Files (x86)\\Inkscape\\inkscape --version'
      else
        '\"C:\\Program Files\\Inkscape\\inkscape\" --version'
      end
    when :mac
      '/Applications/Inkscape.app/Contents/Resources/bin/inkscape --version'
    else
      'inkscape --version'
    end
  end
end
