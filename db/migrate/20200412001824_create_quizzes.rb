class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.text :question, null: false
      t.text :answer, null: false
      t.integer :language_id
      t.timestamps
    end
  end
end
