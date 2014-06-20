class Notify < ActionMailer::Base
  default from: "secret@live.com.my"

  def send_notify(user, track, record)
    @user = user
    @track = track
    @record = record
    mail(to: @user.email, subject: "Great News from Airasia Flight Tracker")
  end
end
