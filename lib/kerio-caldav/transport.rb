module KerioCaldav
	module Transport		
		class << self

			def url=(u)
				@url = u
			end

			def url
				@url
			end
			
			def get(username,password,user)
				raise "url must be set" unless @url
				cmd = "curl -i -s --insecure -u '#{username}:#{password}' #{@url}/#{user}"
				%x(#{cmd})
			end
		end
	end
end