class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_locale

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)
      I18n.locale = params[:locale]
      session[:locale] = I18n.locale
    elsif session[:locale].present?
      I18n.locale = session[:locale]
    else
      I18n.locale = I18n.default_locale
    end
  end
end
