class CreateDailyAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_accounts do |t|
      t.date :date
      t.integer :capacity
      t.integer :filled

      t.timestamps
    end
  end
end
