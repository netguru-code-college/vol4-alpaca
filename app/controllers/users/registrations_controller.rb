# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    super
  end

  def create
    super
    InitializeNewUser.new(current_user).call if current_user
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  def cancel
    super
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[attribute name avatar_url])
  end

  def after_sign_up_path_for(resource)
    super(resource)
  end

  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar_url hay])
  end
end
