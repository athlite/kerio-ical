$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module KerioCaldav
	
	VERSION = '0.0.1'
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