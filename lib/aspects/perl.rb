module Recipe
  def self.ppm
    "ppm --version"
  end

  def self.cpan
    "cpan --version"
  end

  def self.pl
    "perl --version"
  end

  def self.perl
    [ppm, cpan, pl]
  end
end
