require File.dirname(__FILE__) + '/test_helper.rb'

class TestKerioIcal < Test::Unit::TestCase

	def setup
		KerioIcal::Config.config = YAML::load_file(File.join(KerioCaldav::ROOT_DIR, "..", "config", "test_config.yml"))
		@user = KerioIcal::Config['user']
	end

	def test_calendars
		calendars = KerioCaldav::Get.calendars(@user)
		calendars.each do |cal|
			cal.events.each do |event|
				puts event.summary
				print event.dtstart.to_time, " - ", event.dtend.to_time
				print "\n\n"
			end
		end
	end
end
