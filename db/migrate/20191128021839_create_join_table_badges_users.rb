class CreateJoinTableBadgesUsers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :badges, :users do |t|
      t.index [:badge_id, :user_id]
      t.index [:user_id, :badge_id]
      
    end
  end
end