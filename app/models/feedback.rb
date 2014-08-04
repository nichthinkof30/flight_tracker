class Feedback < ActiveRecord::Base

  validates :sender_name, :sender_email, :comment, presence: true
end
