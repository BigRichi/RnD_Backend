class AddIncorrectAnswerToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :incorrect_answers, :text, array: true
   
  end
end
