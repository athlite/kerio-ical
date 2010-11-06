module KerioCaldav
	class Get
		class << self
			def calendars(user)
				Transport::url = Config.url
				result = Transport::get(Config.username, Config.password, user)
				parser = HttpParser.new(result)
				unless parser.authorized?
					raise "unauthorized: #{username} can not watch #{user}'s calendar" 
				end
				unless parser.ok?
					print parser.response(:code), " ", parser.response(:message), "\n"
					raise "error: something went wrong"
				end
				parser.to_ical
			end
		end
	end
end