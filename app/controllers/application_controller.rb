class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :fill_info, if: :user_incomplete?

  protected

  def configure_permitted_parameters
    added_attrs = [
      :battletag, :email, :password, :password_confirmation, :remember_me,
      :region
    ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def user_incomplete?
    current_user && (!current_user.region || !current_user.battletag)
  end

  def fill_info
    flash[:notice] = "Please, fill Battletag and region in your #{view_context.link_to 'profile settings', edit_user_registration_path}.".html_safe
  end
end
