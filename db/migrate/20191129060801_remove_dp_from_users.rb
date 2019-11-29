class RemoveDpFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :dp
  end
end