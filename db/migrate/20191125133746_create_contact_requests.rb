class CreateContactRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_requests do |t|
      t.string :name_encrypted
      t.string :email_address_encrypted
      t.string :telephone_encrypted
      t.text   :comments_encrypted

      # These can be removed if you are using Vault
      t.string :name_encrypted_iv
      t.string :email_address_encrypted_iv
      t.string :telephone_encrypted_iv
      t.string :comments_encrypted_iv

      t.timestamps
    end
    add_index :contact_requests, :name_encrypted_iv, unique: true
    add_index :contact_requests, :email_address_encrypted_iv, unique: true
    add_index :contact_requests, :telephone_encrypted_iv, unique: true
  end
end
