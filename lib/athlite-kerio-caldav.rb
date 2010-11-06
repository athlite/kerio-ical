$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module AthliteKerioCaldav
	
	VERSION = '0.0.1'
	ROOT_DIR = File.expand_path( File.dirname(__FILE__) )
	
	require 'yaml'
	require 'date'
	require 'rubygems'
	require 'icalendar'
	require 'athlite-kerio-caldav/config'
	require 'athlite-kerio-caldav/date_time.rb'
	require 'athlite-kerio-caldav/transport'
	require 'athlite-kerio-caldav/http_parser'
	require 'athlite-kerio-caldav/kerio'
end