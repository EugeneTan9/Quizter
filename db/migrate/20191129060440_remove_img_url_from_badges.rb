class RemoveImgUrlFromBadges < ActiveRecord::Migration[6.0]
  def change

    remove_column :badges, :img_url
  end
end