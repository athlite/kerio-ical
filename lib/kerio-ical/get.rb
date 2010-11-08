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
				transport = Transport::url.match(/^https:/) ? :net_https : :net_http
				result = Transport::get(Config.username, Config.password, user, transport)
				Icalendar.parse(result)
			end
		end
	end
end