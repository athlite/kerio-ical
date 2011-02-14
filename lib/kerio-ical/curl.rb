module KerioIcal
  class Curl
    attr_reader :headers
    def initialize(raw)
      headers,@body = raw.split(/\r\n\r\n/)
      raise "no response" unless headers
      parse_headers( headers )
    end

    def body
      ok? ? @body : ""
    end

    def code
      m = @http_response.match(/HTTP\/1.1 (\d{3,3})/)
      m[1] if m
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

    class << self
      def get(url, username, password, parameters=[])
        cmd = "curl -i -s #{parameters.join(' ')} -u #{username}:#{password} #{url}"
        res = %x(#{cmd})
        self.new(res)
      end
    end

  end
end
