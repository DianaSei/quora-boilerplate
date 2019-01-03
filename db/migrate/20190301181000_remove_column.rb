require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class RemoveColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :user_id
   
  end
end