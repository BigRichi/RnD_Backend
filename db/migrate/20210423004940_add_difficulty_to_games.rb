class AddDifficultyToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :difficulty, :string
  end
end
