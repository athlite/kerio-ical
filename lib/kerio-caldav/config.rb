module KerioCaldav
	# Holds config parameters.
	class Config
		class << self
			
			# set config hash
			def config=(c)
				@config = c
			end
			
			# access config params
			def [](key)
				@config ||= YAML::load_file( File.join(ROOT_DIR, "..", "config", "config.yml") )
				@config[key]
			end
			
			# access to config params through class methods
			# i.e *Config.url*
			def method_missing(name, *options, &block)
				self[name.to_s] or super
			end
			
		end
	end
end