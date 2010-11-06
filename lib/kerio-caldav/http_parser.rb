module KerioCaldav
	class HttpParser
		attr_reader :headers
		def initialize(raw)
			headers,@body = raw.split(/\r\n\r\n/)
			raise "no response" unless headers
			parse_headers( headers )
		end

		def to_ical
			ok? ? Icalendar.parse(@body) : nil
		end
		
		def response(key=nil)
			@http_response_version,@http_response_code,*@http_response_message = @http_response.split
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
		
		def ok?
			@http_response.match(/HTTP\/1.1 200/).nil? ? false : true
		end

		def authorized?
			@http_response.match(/HTTP\/1.1 401/).nil? ? true : false
		end

		private
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