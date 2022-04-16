class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :api_key
      t.string :is_admin
      t.integer :status_id

      t.timestamps
    end
  end
end
