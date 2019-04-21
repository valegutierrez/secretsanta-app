class User < ApplicationRecord
  has_many :events, :through => :attendances
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :managed_events, class_name: "Event", foreign_key: "admin_id"
  has_many :started_conversations, class_name: "Conversation", foreign_key: "first_user_id"
  has_many :received_conversations, class_name: "Conversation", foreign_key: "second_user_id"
  has_many :messages_sent, class_name: "Message", foreign_key: "sender_id"
  has_many :messages_received, class_name: "Message", foreign_key: "receiver_id"
end