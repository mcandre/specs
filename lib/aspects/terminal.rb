module Recipe
  def self.terminal
    if Os.mac?
      'system_profiler -detailLevel full 2>&1 | grep Terminal -A 5 | grep Version -m 1'
    end
  end
end
