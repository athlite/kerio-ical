$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# *Author*::   Thomas T. Eng  (mailto:thomas.tinnesand.eng@gmail.com)
# *Copyright*:: Copyright (c) 2010 Thomas T. Eng
# *License*::   The MIT License
module KerioIcal
	
	# Gem version
	VERSION = '0.0.3'
	
	# Base dir of lib.
	ROOT_DIR = File.expand_path( File.dirname(__FILE__) )
	
	require 'yaml'
	require 'date'
	require 'rubygems'
	require 'icalendar'
	require 'kerio-ical/config'
	require 'kerio-ical/date_time.rb'
	require 'kerio-ical/transport'
	require 'kerio-ical/http_parser'
	require 'kerio-ical/get'
end