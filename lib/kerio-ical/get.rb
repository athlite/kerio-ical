module KerioIcal
	# Gets the calendar objects	
	class Get
		class << self		
			# *user* must be under a directory on mail server.
			# i.e. _http://mail.example.com/ical/example.com/john.doe_
			# 
			# Raises errors in case you are not authorized to view resource
			# or, in general if something is wrong,
			# there will be raised an error, as well as the http header response.
			# 
			# returns an array *Icalendar* objects
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