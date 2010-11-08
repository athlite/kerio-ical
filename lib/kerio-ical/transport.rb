module KerioIcal
	# Methods for accessing curl transport
	module Transport
		class << self
			
			# sets path to calendar service.
			def url=(u)
				@url = u
			end
			# gets path to calendar service.
			def url
				@url
			end
			
			# curl transport
			def get(username,password,user)
				raise "url must be set" unless @url
				cmd = "curl -i -s --insecure -u '#{username}:#{password}' #{@url}/#{user}"
				%x(#{cmd})
			end
		end
	end
end