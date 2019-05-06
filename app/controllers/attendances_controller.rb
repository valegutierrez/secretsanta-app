class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attendance

  def edit
    @event = Event.find_by(id: @attendance.event_id)
    @users = []
    User.all.each do |u|
      if @event.attendances.where(user_id: u).present? and u != current_user
        @users << u
      end
    end
  end

  def update
    @attendance.update!(attendance_params)
    redirect_to conversations_path, notice: 'Your guess was successfully saved.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attendance_params
    params.require(:attendance).permit(:event_id, :user_id, :user_guess_id)
  end
end