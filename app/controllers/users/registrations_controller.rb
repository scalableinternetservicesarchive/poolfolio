# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token

  protected
  #
  #The path used after sign up.
  def after_update_path_for(resource)
    current_user
  end

  def after_sign_up_path_for(resource)
    current_team = Team.find(current_user.team_id)
    current_team.update_attribute(:balance, current_team.balance += 1000)
    current_user
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end


  #
  # def after_update_path_for(resource)
  #   user_path(resource)
  # end

  #The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
