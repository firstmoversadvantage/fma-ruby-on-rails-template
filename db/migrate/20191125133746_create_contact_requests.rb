class CreateContactRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_requests do |t|
      t.string :name
      t.string :telephone
      t.string :email_address

      t.timestamps
    end
  end
end
