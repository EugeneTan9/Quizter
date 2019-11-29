class DropQuestions < ActiveRecord::Migration[6.0]
  def change
    drop_table :options
    drop_table :questions
    create_table :questions do |t|
      t.references :quiz
      t.integer :question_num
      t.text :body
      t.string :type
      t.timestamps
    end
  end
end