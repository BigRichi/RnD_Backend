class RemoveIncorrectAnswersFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :incorrect_answers, :string
  end
end
