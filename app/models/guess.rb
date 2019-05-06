class Guess < ApplicationRecord
  belongs_to :user
  belongs_to :user_guess, class_name: 'User', foreign_key: 'user_guess_id'
end
