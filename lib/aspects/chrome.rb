module Recipe
  def self.chrome
    # Assumes Chrome installed in default directory.
    if Os.mac?
      '/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome --version 2>&1 | grep -v Unsure' # Redirect stderr to stdout
    elsif Os.windows?
      'reg query "HKEY_LOCAL_MACHINE\\SOFTWARE\\Google\\Update\\Clients\\{4DC8B4CA-1BDA-483e-B5FA-D3C12E15B62D}"'
      # Assumes
      # * binary is google-chrome.
      # * binary is in PATH.
    else
      'google-chrome --version'
    end
  end
end
