require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :answers, :questions_id, :question_id
  end
end