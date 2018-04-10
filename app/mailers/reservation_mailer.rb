class ReservationMailer < ApplicationMailer
  def send_email_to_guest(guest, room)
    @recipient = guest
    @room = room
    mail(to: @recipient.email, from: "AirKong Team", subject: "Enjoy Your Trip! 😎")
  end
end
