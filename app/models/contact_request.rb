class ContactRequest < ApplicationRecord
  attr_accessor :name, :email_address, :telephone

  validates :name, presence: true, length: { maximum: 20 }
  validates :email_address, presence: true, 
                            length: { maximum: 50 },
                            format: { with: Devise::email_regexp }
  validates :comments, length: { maximum: 500 }

  include Vault::EncryptedModel
  vault_lazy_decrypt!
  
  vault_attribute :name
  vault_attribute :email_address
  vault_attribute :telephone

  default_scope { order('created_at DESC') }
end
