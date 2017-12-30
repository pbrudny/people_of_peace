class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :skype, :phone, :fb, :note)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :skype, :phone, :fb, :note, :current_password)
  end
end
