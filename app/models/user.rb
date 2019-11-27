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

  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  def login
    @login || self.username
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username)
      where(conditions.to_h).first
    end
  end
end
