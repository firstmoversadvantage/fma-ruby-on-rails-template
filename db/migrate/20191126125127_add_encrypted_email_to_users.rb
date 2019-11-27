class AddEncryptedEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email_encrypted, :string
  end
end
