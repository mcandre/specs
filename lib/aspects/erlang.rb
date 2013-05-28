module Recipe
  def self.rebar
    "rebar -V"
  end

  def self.erl
    "erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell"
  end

  def self.erlang
    [rebar, erl]
  end
end
