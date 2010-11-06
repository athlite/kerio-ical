require File.dirname(__FILE__) + '/test_helper.rb'

class TestAthliteKerioCaldav < Test::Unit::TestCase

	def setup
	end

	def test_transport
		calendars = AthliteKerioCaldav::Transport.ical(@username, @password, @user)
		calendars.each do |cal|
			cal.events.each do |event|
				puts event.summary
				print event.dtstart.to_time, " - ", event.dtend.to_time
				print "\n\n"
			end
		end
	end
end
