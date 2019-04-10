class Event < ApplicationRecord
  has_many :attendances
  has_many :users, :through => :attendances
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
  after_create_commit :create_attendances
  before_create :set_access_link

  def create_attendances
    attendance_admin = Attendance.create(event_id: self.id, user_id: admin_id)
    attendance_admin.save!
    (self.members - 1).times do |m|
      attendance = Attendance.create(event_id: self.id)
      attendance.save!
    end
  end

  def set_access_link
    self.access_code_link = generate_code
  end

  def generate_code
    SecureRandom.hex(10)
  end
end