class EventMailer < ApplicationMailer
  def notify_author(author, event)
    @author = author
    @event = event

    mail(to: @author.email, subject: "20 minutes until #{@event.title}!")
  end
end
