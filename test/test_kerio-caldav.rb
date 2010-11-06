require File.dirname(__FILE__) + '/test_helper.rb'

class TestKerioCaldav < Test::Unit::TestCase

	def setup
	end

	def test_transport
		calendars = KerioCaldav::Kerio.calendars(@username, @password, @user)
		calendars.each do |cal|
			cal.events.each do |event|
				puts event.summary
				print event.dtstart.to_time, " - ", event.dtend.to_time
				print "\n\n"
			end
		end
	end
end
