module Recipe
  def self.virtualbox
    case Os.os_name
    when :windows
      if Os.x86?
        '"C:\\Program Files\\Oracle\\VirtualBox\\VBoxManage" --version'
      else
        'C:\\Program Files (x86)\\Oracle\\VirtualBox\\VBoxManage --version'
      end
    when :mac
      'vboxwebsrv --help 2>&1 | grep VirtualBox'
    else
      'vboxwebsrv --help 2>&1 | grep VirtualBox'
    end
  end
end
