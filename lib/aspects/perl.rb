module Recipe
  def self.cpan
    'cpan --version'
  end

  def self.pl
    'perl --version'
  end

  def self.perl
    [cpan, pl]
  end
end
