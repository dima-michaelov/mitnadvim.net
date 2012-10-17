class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum :role, [:admin, :volunteer, :school]

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :age, :area_id, :email, :facebook_id, :first_name, :gender, :last_name, :phone_number, :school_id, :role
  attr_accessible :area, :school

  belongs_to :area
  belongs_to :school

end