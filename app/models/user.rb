class User < ApplicationRecord
  has_many :attendances, :dependent => :destroy
  has_many :events, :through => :attendances, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :managed_events, class_name: "Event", foreign_key: "admin_id", :dependent => :destroy
  has_many :guessings, class_name: "Attendance", foreign_key: "user_guess_id", :dependent => :destroy
  has_many :started_conversations, class_name: "Conversation", foreign_key: "first_user_id", :dependent => :destroy
  has_many :received_conversations, class_name: "Conversation", foreign_key: "second_user_id", :dependent => :destroy
  has_many :messages_sent, class_name: "Message", foreign_key: "sender_id", :dependent => :destroy
  has_many :messages_received, class_name: "Message", foreign_key: "receiver_id", :dependent => :destroy

  require 'open-uri'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      downloaded_image = open(auth.info.image)
      user.image.attach(io: downloaded_image, filename: 'avatar.jpg', content_type: downloaded_image.content_type)
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end
end