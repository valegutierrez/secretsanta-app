class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
    @notifications.update_all checked: true
  end
end
