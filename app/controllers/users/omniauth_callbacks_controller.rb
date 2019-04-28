class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])

		if @user.persisted?
			sign_in_and_redirect @user
			set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
		else
			redirect_to root_path, notice: 'Error at login in with Facebook'
		end
	end
end