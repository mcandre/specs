module Recipe
  def self.bios
    if Os.windows?
      "systeminfo | findstr /B /C:\"BIOS Version\""
    end
  end
end
