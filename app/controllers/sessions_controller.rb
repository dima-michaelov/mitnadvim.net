class SessionsController < ApplicationController
  def new
    @type = params.key?(:school) ? 'schools' : 'volunteers'

  end

  def create
    user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
      session[:user_id] = user.id
      return_url = user.school? ? requests_path : root_path
      redirect_to return_url, :notice => "התחברת בהצלחה!"
    else
      flash.now.alert = I18n.t('errors.messages.login_fail')
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => I18n.t('errors.messages.logged_out')
  end
end