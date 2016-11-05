class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_timezone

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    added_attrs = [
      :battletag, :email, :password, :password_confirmation, :remember_me,
      :region, :timezone
    ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def user_not_authorized
    flash[:alert] = 'you are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def set_timezone
    tz = current_user ? current_user.timezone : nil
    Time.zone = tz || ActiveSupport::TimeZone['Moscow']
  end
end
