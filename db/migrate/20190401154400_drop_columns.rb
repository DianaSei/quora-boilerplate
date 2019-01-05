require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class DropColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :user_id
    remove_column :answers, :question_id
   
  end
end