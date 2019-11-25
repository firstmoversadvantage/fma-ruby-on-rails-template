class ContactRequest < ApplicationRecord
  include Vault::EncryptedModel
  vault_attribute :name, :email_address, :telephone
end
