module KerioIcal
	# Parse calendar response
	class HttpParser
		attr_reader :headers
		
		# http text 
		# *headers*:: http headers
		# *body*:: the VCALENDAR object
		def initialize(http)
			headers,@body = http.split(/\r\n\r\n/)
			raise "no response" unless headers
			parse_headers( headers )
		end
		
		# returns *Icalendar* object
		def to_ical
			ok? ? Icalendar.parse(@body) : nil
		end
		
		# access the response headers
		def response(key=nil)
			@http_response_version,
			@http_response_code,
			*@http_response_message = @http_response.split
			@http_response_message = @http_response_message.join(" ")
			case key
			when :version
				@http_response_version
			when :code
				@http_response_code
			when :message
				@http_response_message
			end
		end
		
		# Success?
		def ok?
			response(:code) == "200" ? true : false
		end
		
		# Login failure?
		def authorized?
			response(:code) == "401" ? false : true
		end

		private
		# arrange headers into a hash
		def parse_headers(headers)
			headers = headers.split(/\r\n/)
			@headers = {}
			@http_response = headers.shift
			headers.each do |line|
				key, value = line.split(":")
				@headers[key] = value
			end
		end
	end
end