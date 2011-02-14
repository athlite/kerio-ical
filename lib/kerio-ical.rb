$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# *Author*::   Thomas T. Eng  (mailto:thomas.tinnesand.eng@gmail.com)
# *Copyright*:: Copyright (c) 2010 Thomas T. Eng
# *License*::   The MIT License
module KerioIcal

  # Version
  VERSION = '0.0.2'

  # Base dir of lib.
  ROOT_DIR = File.expand_path( File.dirname(__FILE__) )

  require 'yaml'
  require 'date'
  require 'net/http'
  require 'net/https'
  require 'rubygems'
  require 'icalendar'
  require 'kerio-ical/config'
  require 'kerio-ical/date_time.rb'
  require 'kerio-ical/transport'
  require 'kerio-ical/curl'
  require 'kerio-ical/get'

  class << self
    def logger
      if Object.const_defined?("RAILS_DEFAULT_LOGGER")
        RAILS_DEFAULT_LOGGER
      else
        @logger ||= Logger.new("/tmp/kerio-ical.log")
      end
    end
  end
end
