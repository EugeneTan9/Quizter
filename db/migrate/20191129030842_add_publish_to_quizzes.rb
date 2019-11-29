class AddPublishToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :isPublished, :boolean, null: false, default: false
  end
end