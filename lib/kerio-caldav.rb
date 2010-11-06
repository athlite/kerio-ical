$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# *Author*::   Thomas T. Eng  (mailto:thomas.tinnesand.eng@gmail.com)
# *Copyright*:: Copyright (c) 2010 Thomas T. Eng
# *License*::   The MIT License
module KerioCaldav
	
	# Gem version
	VERSION = '0.0.1'
	
	# Base dir of lib.
	ROOT_DIR = File.expand_path( File.dirname(__FILE__) )
	
	require 'yaml'
	require 'date'
	require 'rubygems'
	require 'icalendar'
	require 'kerio-caldav/config'
	require 'kerio-caldav/date_time.rb'
	require 'kerio-caldav/transport'
	require 'kerio-caldav/http_parser'
	require 'kerio-caldav/get'
end