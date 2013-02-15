module Recipe
	def self.npm
		"npm --version"
	end

	def self.js
		"node --version"
	end

	def self.node
		[npm, js]
	end
end