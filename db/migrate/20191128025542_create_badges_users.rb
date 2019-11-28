class CreateBadgesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :badges_users do |t|

      t.timestamps
    end
  end
end
