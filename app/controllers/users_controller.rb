class UsersController < ApplicationController

  def show
    @active_responses = current_user.responses.active.newest_first
    @completed_responses = current_user.responses.completed.newest_first
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    @user.role = :volunteer

    if @user.save
      sign_in(@user)
      RegistrationMailer.delay.welcome_user(@user)
      redirect_to root_path, :notice => t("flashes.users.created")
    else
      @errors = @user.errors.full_messages
      flash[:error] = @errors
      render :action => "new"
    end

  end

end