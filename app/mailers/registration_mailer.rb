class RegistrationMailer < ActionMailer::Base
  default from: "noreply@mitnadvim.net"

  def welcome_user(user)
    @user = user
    mail(to: @user.email, subject: I18n.t('email.subject.welcome_user'))
  end

  def welcome_school(school)
    @school = school
    mail(to: @school.admin.email, subject: I18n.t('email.subject.welcome_school'))
  end

  def new_response(response)
    @response = response
    mail(to: @response.request.school.admin.email, subject: I18n.t('email.subject.new_response'))
  end
end
