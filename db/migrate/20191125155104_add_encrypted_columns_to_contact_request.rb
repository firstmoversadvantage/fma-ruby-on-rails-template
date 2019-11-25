class AddEncryptedColumnsToContactRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :contact_requests, :name_encrypted, :string
    add_column :contact_requests, :email_address_encrypted, :string
    add_column :contact_requests, :telephone_encrypted, :string
  end
end
