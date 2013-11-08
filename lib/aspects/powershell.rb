module Recipe
  def self.powershell
    if Os.windows?
      '@powershell Get-Host'
    end
  end
end
