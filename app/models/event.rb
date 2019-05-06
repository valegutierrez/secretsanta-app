class Event < ApplicationRecord
  has_many :attendances, :dependent => :destroy
  has_many :conversations, :dependent => :destroy
  has_many :users, :through => :attendances, :dependent => :destroy
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
  after_create_commit :create_attendances
  before_create :set_access_link

  def create_attendances
    attendance_admin = Attendance.create(event_id: self.id, user_id: admin_id)
    (self.members - 1).times do |m|
      attendance = Attendance.create(event_id: self.id)
    end
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