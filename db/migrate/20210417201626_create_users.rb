class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :high_score
      t.integer :rank

      t.timestamps
    end
  end
end
