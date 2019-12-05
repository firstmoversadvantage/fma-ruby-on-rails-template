class ContactRequest < ApplicationRecord
  attr_accessor :name, :email_address, :telephone

  validates :name, presence: true
  validates :email_address, presence: true
  validates :comments, length: { maximum: 500 }

  include Vault::EncryptedModel
  vault_lazy_decrypt!
  
  vault_attribute :name
  vault_attribute :email_address
  vault_attribute :telephone
end
