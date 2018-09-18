# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket
  before_action :set_event
  after_action :verify_authorized

  def show
    respond_to do |format|
      format.html {}
      format.pdf do
        render pdf: "file_name" # Excluding ".pdf" extension.
      end
      format.png do
        require "barby/outputter/png_outputter"
        text = scan_ticket_url(@ticket.token)
        barcode = Barby::QrCode.new(
          text,
          level: :q
        )
        blob = Barby::PngOutputter.new(barcode).to_png(xdim: 5)
        send_data blob, type: "image/png", disposition: :inline
      end
    end
  end

  def scan
    if @ticket.scan # scan sets scanned=true and scanned_at
      flash.now[:notice] = I18n.t("ticket.scanned.success")
    else
      flash.now[:error] = @ticket.errors.messages # "could not scan ticket, please try again"
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
