# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "Freevents <noreply@#{ENV['ACTION_MAILER_DEFAULT_URL_HOST']}>"
  layout "mailer"
end
