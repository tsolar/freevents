class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket
  before_action :set_event
  after_action :verify_authorized

  def show
  end

  def scan
    if ticket.scan # scan sets scanned=true and scanned_at
      flash[:notice] = "ok"
    else
      flash[:error] = "could not scan ticket, please try again"
    end
  end

  def print
    # shows PDF
  end

  private
    def set_event
      @event = @ticket.holder.event
    end

    def set_ticket
      @ticket = Ticket.find_by(token: params[:token])
      authorize @ticket
    end
end
