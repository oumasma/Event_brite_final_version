class Attendance < ApplicationRecord
	after_create :event_participation_email
	belongs_to :user
    belongs_to :event

    def event_participation_email
		UserMailer.event_participation_email(self.user, self.event).deliver_now
	end
end