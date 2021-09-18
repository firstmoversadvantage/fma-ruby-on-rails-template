class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string  :name
      t.string  :telephone
      t.string  :telephone_country_code, default: '1'
      t.string  :billing_address
      t.string  :billing_city
      t.string  :billing_state
      t.string  :billing_country_code, default: 'US'
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
