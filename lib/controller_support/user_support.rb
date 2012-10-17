require 'active_support/concern'

module UserSupport

  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :user_signed_in?, :sign_in
    helper_method :must_be_volunteer, :must_be_school, :must_be_admin
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def user_signed_in?
    current_user.present?
  end

  def must_be_volunteer
    user_signed_in? && current_user.volunteer?
  end

  def must_be_school
    if (!user_signed_in? || !current_user.school?)
      flash.now[:notice] = "You are not a school"
    end
  end

  def must_be_admin
    user_signed_in? && current_user.admin?
  end
end

