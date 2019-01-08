require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class RenameColumnQuestionId < ActiveRecord::Migration[5.0]
  def change
    rename_column :votes, :question_id, :value
  end
end