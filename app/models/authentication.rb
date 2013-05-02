class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :provider, :uid, :token, :token_secret
  
  belongs_to :user
  
end
