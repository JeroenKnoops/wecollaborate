class User < ActiveRecord::Base
  include PublicActivity::Model

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  after_create :create_activity_record
  
  def create_activity_record
    self.create_activity(:created_user, :owner => self)
  end

end
