class EventMailer < ApplicationMailer
  def notify_author(author, event)
    @author = author
    @event = event

    mail(to: @author.email, subject: "20 minutes until #{@event.title}!")
  end

  def notify_user(user, event)
    @user = user
    @event = event

    mail(to: @user.email, subject: "20 minutes until #{@event.title}!")
  end

  def request_approved(user, event)
    @user = user
    @event = event

    mail(to: @user.email, subject: "Participation in  #{@event.title} was approved.")
  end
end
