class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :api_key, :string
    add_column :users, :status_id, :integer
    add_column :users, :name, :string
    add_column :users, :is_admin, :boolean
  end
end
