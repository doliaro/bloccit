class Question < ActiveRecord::Base
	# has_many :questions

	def resolved_or_pending
		self.resolved ? "Resolved" : "Pending"
	end
end
