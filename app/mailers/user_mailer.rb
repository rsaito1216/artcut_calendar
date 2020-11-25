class UserMailer < ApplicationMailer
  default from: ENV['EMAIL_ADDRESS']
 
  def send_mail(event)
    @event = event
    @url = "https://art-calendar.herokuapp.com/"
    @greeting = ''
    mail to: @event.user.email, subject: '予約登録完了のお知らせ'
  end
end
