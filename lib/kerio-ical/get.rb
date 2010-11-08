module KerioIcal
	# Gets the calendar objects	
	class Get
		class << self		
			# *user* must be under a directory on mail server.
			# i.e. _http://mail.example.com/ical/example.com/john.doe_
			# 
			# returns an array *Icalendar* objects
			def calendars(user)
				Transport::url = Config.url
				result = Transport::get(Config.username, Config.password, user, :net_https)
				Icalendar.parse(result)
			end
		end
	end
end