module AthliteKerioCaldav
	class Kerio
		class << self
			def calendars(user)
				Transport::url = Config.url
				result = Transport::get(Config.username, Config.password, user)
				parser = HttpParser.new(result)
				unless parser.authorized?
					raise "unauthorized: #{username} can not watch #{user}'s calendar" 
				end
				unless parser.ok?
					raise "error: something went wrong"
				end
				parser.to_ical
			end
		end
	end
end