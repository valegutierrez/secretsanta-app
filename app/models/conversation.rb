class Conversation < ApplicationRecord
  belongs_to :first_user, class_name: 'User', foreign_key: 'first_user_id'
  belongs_to :second_user, class_name: 'User', foreign_key: 'second_user_id'
  belongs_to :event
  has_many :notifications, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  after_create_commit :create_notifications

  def create_notifications
    @user = User.find(self.first_user_id)
    @notification = Notification.create(conversation_id: self.id, user_id: @user.id)
  end
end
