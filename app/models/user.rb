class User < ActiveRecord::Base
  include PublicActivity::Model

  has_many :friendships
  has_many :friends, :through => :friendships
  
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  has_many :authentications
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  after_create :create_activity_record
  
  scope :recent, lambda {|number| order("created_at desc").limit(number)}
  
  has_many :projects
  
  def create_activity_record
    self.create_activity(:created_user, :owner => self)
  end
  
  def apply_omniauth(omni)
     authentications.build(:provider => omni['provider'], 
                           :uid => omni['uid'], 
                           :token => omni['credentials'].token, 
                           :token_secret => omni['credentials'].secret)
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super #&& provider.blank?
  end
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def to_s
    email
  end
end
