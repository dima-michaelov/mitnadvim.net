class RegistrationMailer < ActionMailer::Base
  layout 'mail'
  default from: "noreply@mitnadvim.net"

  def welcome_user(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: I18n.t('email.welcome_user.subject'))
  end

  def welcome_school(school_id)
    @school = School.find(school_id)
    mail(to: @school.admin.email, subject: I18n.t('email.welcome_school.subject'))
  end

  def new_response(response_id)
    @response = Response.find(response_id)
    mail(to: @response.request.school.admin.email, subject: I18n.t('email.new_response.subject'))
  end
end
