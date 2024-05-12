class Notification < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
end
