require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :description
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end