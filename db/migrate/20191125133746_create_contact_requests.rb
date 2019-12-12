class CreateContactRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_requests do |t|
      t.string :name_encrypted
      t.string :email_address_encrypted
      t.string :telephone_encrypted
      t.text :comments

      t.timestamps
    end
  end
end
