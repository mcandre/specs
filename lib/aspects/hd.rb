module Recipe
  def self.hd
    if Os.windows?
      "fsutil fsinfo drives"
    else
      "df -h"
    end
  end
end
