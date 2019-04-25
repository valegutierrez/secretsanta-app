class Event < ApplicationRecord
  has_many :attendances
  has_many :conversations
  has_many :users, :through => :attendances
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
  after_create_commit :create_attendances
  before_create :set_access_link
  before_destroy :delete_attendances, :delete_conversations

  def create_attendances
    attendance_admin = Attendance.create(event_id: self.id, user_id: admin_id)
    attendance_admin.save!
    (self.members - 1).times do |m|
      attendance = Attendance.create(event_id: self.id)
      attendance.save!
    end
  end

  def delete_attendances
    self.attendances.delete_all
  end

  def delete_conversations
    self.conversations.delete_all
  end

  def add_new_user(user)
    @attendance = self.attendances.where(user_id: nil).first
    if @attendance == nil
      false
    else
      @attendance.update!(user_id: user.id)
      true
    end
  end

  def set_access_link
    self.access_code_link = generate_code
  end

  def generate_code
    SecureRandom.hex(10)
  end
end