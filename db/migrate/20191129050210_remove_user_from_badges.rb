class RemoveUserFromBadges < ActiveRecord::Migration[6.0]
  def change
    remove_column :badges, :user_id
  end
end
