# Preview all emails at http://localhost:3000/rails/mailers/ticket
class TicketPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ticket/send_to_holder
  def send_to_holder
    ticket = Ticket.last || create(:ticket)
    TicketMailer.send_to_holder(ticket)
  end

end
