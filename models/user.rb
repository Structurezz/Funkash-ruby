require 'active_record'
require 'bcrypt'

class User < ActiveRecord::Base
    has_secure_password
  
    validates :name, presence: true, allow_blank: true
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
  
