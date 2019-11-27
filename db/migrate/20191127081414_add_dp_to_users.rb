class AddDpToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :dp, :string, default: 'https://web.aflia.net/wp-content/uploads/2018/12/dp_placeholder-275x300.jpg'
    add_column :users, :isActive, :boolean, null: false, default: true
    add_column :users, :isPublic, :boolean, null: false, default: true
    add_column :users, :isAdmin, :boolean, null: false, default: false
  end
end