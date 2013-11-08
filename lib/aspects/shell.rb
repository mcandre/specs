module Recipe
  def self.shell
    if Os.windows?
      'echo %cmdextversion%'
    elsif Os.unix?
      'sh --version'
    end
  end
end
