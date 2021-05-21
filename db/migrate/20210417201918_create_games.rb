class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :score
      t.string :game_type
      t.float :time
      t.integer :num_of_questions
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
