# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email_encrypted        :string(255)
#  email_encrypted_iv     :string(255)
#  email_hash             :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  failed_attempts        :integer          default(0), not null
#  is_admin               :boolean          default(FALSE)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string(255)
#  unlock_token           :string(255)
#  username               :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email_encrypted_iv    (email_encrypted_iv) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  before_save :create_email_hash

  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         authentication_keys: [:username]

  # For attr_encrypted:
  attr_encrypted_options.merge!(
    key: Rails.application.credentials.attribute_key,
    prefix: '',
    suffix: '_encrypted')
  attr_encrypted :email

  # For Vault:
  # attr_accessor :email
  # include Vault::EncryptedModel
  # vault_attribute :email

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3 }

  def self.search_by_email_hash(email)
    where(email_hash: Digest::SHA256.hexdigest(email)).first
  end

  def create_email_hash
    self.email_hash = Digest::SHA256.hexdigest(email)
  end

  # This method is required from somewhere deep in Rails. I think it will tell
  # ActiveRecord to not save the email attribute. Test are red without this
  # method.
  def will_save_change_to_email?
    false
  end
end
