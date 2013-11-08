module Recipe
  def self.firefox
    # Assumes Firefox is installed in the default directory.
    if Os.windows?
      'C:\\Program Files (x86)\\Mozilla Firefox\\firefox --version'
    elsif Os.mac?
      '/Applications/Firefox.app/Contents/MacOS/firefox --version'
      # Assumes firefox in PATH.
    else
      'firefox --version'
    end
  end
end
