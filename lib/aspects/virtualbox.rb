module Recipe
  def self.virtualbox
    # Assumes Firefox is installed in the default directory.
    if Os.windows?
      if Os.x86?
        "\"C:\\Program Files\\Oracle\\VirtualBox\\VBoxManage\" --version"
      else
        "C:\\Program Files (x86)\\Oracle\\VirtualBox\\VBoxManage --version"
      end
    elsif Os.mac?
      "/Applications/Firefox.app/Contents/MacOS/firefox --version"
      # Assumes firefox in PATH.
    else
      "firefox --version"
    end
  end
end
