# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception # , prepend: true

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def render_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  private

  def user_not_authorized
    flash[:alert] = I18n.t("unauthorized")
    redirect_to(request.referrer || root_path)
  end
end
