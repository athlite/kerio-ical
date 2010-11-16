module KerioIcal
	# Gets the calendar objects	
	class Get
		class << self
			
			def transport=(t)
				@transport = t
			end
			
			def transport
				@transport ||= :net_http
			end
			
			def transports
				[:curl,:net_http]
			end
			
			# *user* must be under a directory on mail server.
			# i.e. _http://mail.example.com/ical/example.com/john.doe_
			# 
			# returns an array *Icalendar* objects
			def calendars(user)
				Transport::url = Config.url
				
				_started = Time.now
				result = Transport::get(Config.username, Config.password, user, self.transport)
				_ended = Time.now
				KerioIcal.logger.info "Transport::get spent #{_ended - _started}, with #{self.transport}"
				
				_started = Time.now
				cals = Icalendar.parse(result)
				_ended = Time.now
				KerioIcal.logger.info "Icalendar::parse spent #{_ended - _started}"
				
				cals
			end
			
			def multiple_users_calendars(users)
				
				users.each do |user|
					
					user.instance_eval do 
						def calendars=(c); @calendars = c; end
						def calendars; @calendars; end
						def thread=(t); @thread=t; end
						def thread; @thread; end
					end
					
					user.thread = Thread.start do
						_start = Time.now
						user.calendars = calendars(user) rescue []
						_end = Time.now
						user.instance_variable_set '@tps', (_end - _start)
					end
				end
				users.each {|user| user.thread.join }
				users
			end
			
			def method_missing(name, *args, &block)
				self.transport = transports.select{|t| "calendars_#{t}".to_sym == name }.first
				super unless self.transport
				calendars(args.shift)
			end
		end
	end
end