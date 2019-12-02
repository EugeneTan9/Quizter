class AddTimestampToBadgesUsers < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :badges_users, null: true 
  long_ago = DateTime.new(2019, 11, 11)
    BadgesUser.update_all(created_at: long_ago, updated_at: long_ago)
  
    change_column_null :badges_users, :created_at, false
    change_column_null :badges_users, :updated_at, false
  end
end
