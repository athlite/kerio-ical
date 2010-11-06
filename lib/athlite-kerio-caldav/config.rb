module AthliteKerioCaldav
	class Config
		class << self
			
			def config=(c)
				@config = c
			end
			
			def [](key)
				@config ||= YAML::load_file( File.join(ROOT_DIR, "..", "config", "config.yml") )
				@config[key]
			end
			
			def method_missing(name, *options, &block)
				self[name.to_s] or super
			end
			
		end
	end
end