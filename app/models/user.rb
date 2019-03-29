class User < ApplicationRecord
  has_many :events, :through => :attendances
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :managed_events, class_name: "Event", foreign_key: "admin_id"

end