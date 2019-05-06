class Attendance < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event
  belongs_to :user_guess, class_name: 'User', foreign_key: 'user_guess_id', optional: true

end
