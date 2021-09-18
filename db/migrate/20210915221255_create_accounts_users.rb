class CreateAccountsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts_users do |t|
      t.bigint :account_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
