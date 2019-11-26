class ContactRequest < ApplicationRecord
  include Vault::EncryptedModel
  vault_lazy_decrypt!
  
  vault_attribute :name
  vault_attribute :email_address
  vault_attribute :telephone
end
