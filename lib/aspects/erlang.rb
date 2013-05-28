module Recipe
  def self.erl
    "erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell"
  end

  def self.erlang
    [erl]
  end
end
