class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  has_many :answers, :dependent => :destroy

  accepts_nested_attributes_for :answers

  validates_associated :answers
end
