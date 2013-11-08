# Module name must be filename, minus .rb, in CamelCase.
module Recipe
  # ModuleName.command returns the appropriate command line instruction for returning the relevant specifications.
  # OS-contextual instructions can be modulated by querying the Os module (see the root specs Ruby code).
  def self.hardware
    # Use environment variable.
    if Os.windows?
      'systeminfo | findstr /B /C:\"System Manufacturer\" /C:\"System Model\"'
      # Produces a noticeable delay.
    elsif Os.mac?
      'system_profiler | grep \'Model Identifier\''
      # Assume:
      # * OS is a Unix variant.
      # * dmidecode is installed.
    else
      'sudo dmidecode -t system | grep Manufacturer|Product'
    end
  end
end
