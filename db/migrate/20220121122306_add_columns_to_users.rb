class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :introduction, :text
    add_column :users, :postcode, :integer
    add_column :users, :address, :string
  end
end
