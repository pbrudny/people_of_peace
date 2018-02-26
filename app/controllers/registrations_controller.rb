class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    User.where(notify: true).each do |user|
      UserMailer.new_user(user, resource).deliver_now
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :skype, :phone, :fb, :note)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :skype, :phone, :fb, :note, :current_password)
  end
end
