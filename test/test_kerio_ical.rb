require File.dirname(__FILE__) + '/test_helper.rb'

class TestKerioIcal < Test::Unit::TestCase

	def setup
		KerioIcal::Config.config = YAML::load_file(File.join(KerioIcal::ROOT_DIR, "..", "config", "test_config.yml"))
		@user = KerioIcal::Config['user']
	end

	def test_calendars
		calendars = KerioIcal::Get.calendars(@user)
		calendars.each do |cal|
			assert_equal cal.class, Icalendar::Calendar
			cal.events.each do |event|
				assert_equal event.class, Icalendar::Event
			end
		end
	end
	
	def test_inject_username_password
		url = "http://example.com"
		assert_equal "http://user:pass@example.com", KerioIcal::Transport::inject_username_password(url, "user", "pass")
	end
	
end
