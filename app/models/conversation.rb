class Conversation < ApplicationRecord
  belongs_to :first_user, class_name: 'User', foreign_key: 'first_user_id'
  belongs_to :second_user, class_name: 'User', foreign_key: 'second_user_id'
end
