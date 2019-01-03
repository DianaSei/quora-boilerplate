require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :description
      t.integer :user_id
      t.integer :answers_id

      t.timestamps
    end
  end
end