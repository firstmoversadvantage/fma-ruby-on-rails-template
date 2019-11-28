class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  attr_writer :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         authentication_keys: [:login]

  include Vault::EncryptedModel
  vault_attribute :email

  validates :username, presence: :true,
                       uniqueness: {
                         case_sensitive: false
                       },
                       length: {
                         minimum: 3
                       }

  def login
    @login || self.username
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(
                          [
                            "lower(username) = :value", 
                            { :value => login.downcase }
                          ]
                       ).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
