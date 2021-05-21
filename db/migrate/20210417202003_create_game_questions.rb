class CreateGameQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :game_questions do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
