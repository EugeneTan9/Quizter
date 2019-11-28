class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.string :title
      t.integer :criteria
      t.string :img_url
      t.timestamps
    end
  end
end