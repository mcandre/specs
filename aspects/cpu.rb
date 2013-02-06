module Recipe
	def Recipe.cpu
		if Os.windows?
			"wmic cpu get NumberOfCores, NumberOfLogicalProcessors"
		elsif Os.mac?
			[
				"system_profiler | grep Cores: ",
				"system_profiler | grep Processors:"
			]
		else
			"cat /proc/cpuinfo | grep processor | wc -l"
		end
	end
end