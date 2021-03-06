class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    UserMailer.welcome_user(resource).deliver_now

    User.notifiable.except_him(resource).each do |user|
      UserMailer.new_user(user, resource).deliver_now
    end
    people_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :skype, :phone, :fb, :note)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :skype, :phone, :fb, :note, :current_password)
  end
end
