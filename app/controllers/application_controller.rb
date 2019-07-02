# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception # , prepend: true

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  rescue_from ActiveRecord::RecordNotFound do
    render_404
  end

  def render_404
    render file: Rails.root.join("public", "404.html"),
           layout: false,
           status: :not_found
  end

  private

  def user_not_authorized
    flash[:alert] = I18n.t("unauthorized")
    redirect_to(request.referer || root_path)
  end
end
