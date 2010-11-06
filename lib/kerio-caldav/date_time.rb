class DateTime
	def to_time
		Time.mktime(self.year, self.month, self.day, self.hour, self.min, self.sec)
	end
end
