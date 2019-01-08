require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class RemoveColumnAnswersId < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :answers_id
  end
end