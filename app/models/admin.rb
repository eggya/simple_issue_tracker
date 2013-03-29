class Admin < ActiveRecord::Base
  devise  :database_authenticatable, 
          :token_authenticatable, 
          :validatable,
          :recoverable
  
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
