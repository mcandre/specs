module Recipe
  def self.virtualbox
    case Os.os_name
    when :windows
      if Os.x86?
        '\"C:\\Program Files\\Oracle\\VirtualBox\\VBoxManage\" --version'
      else
        'C:\\Program Files (x86)\\Oracle\\VirtualBox\\VBoxManage --version'
      end
    when :mac
      '/Applications/Firefox.app/Contents/MacOS/firefox --version'
    else
      'firefox --version'
    end
  end
end
