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
			
			# _parameters_:
			# *username*:: an authorized user
			# *password*:: with password
			# *user*:: the user we wish to list
			# *transport*:: \:net_http or \:net_https
			def get(username, password, user, transport = :net_http)
				return net_http(username, password, user, false) if transport == :net_http
				return net_http(username, password, user, true) if transport == :net_https
				""
			end
			
			# http transport
			def net_http(username, password, user, ssl = true)
				uri = URI.parse( inject_username_password("#{@url}/#{user}", username, password) )
				@http=Net::HTTP.new(uri.host, uri.port)
				@http.use_ssl= true if ssl
				resp = ""
				@http.start do |http|
					req = Net::HTTP::Get.new(uri.path)
					req.basic_auth uri.user, uri.password
					response = http.request(req)
					raise "not authorized" if response.code == "401"
					raise "could not find user: '#{user}'" if response.code == "404"
					raise "something not right [#{response.code}]" unless response.code == "200"
					resp = response.body
				end
				resp
			end
			
			# Prefixes url with username and password.
			# <p>\http://example.com => \http://user:pass@example.com</p>
			def inject_username_password(url,username,password)
				url = url.split("://")
				url[0] += "://"
				url.push(url.last)
				url[1] = "#{username}:#{password}@"
				url = url.join
			end
		end
	end
end