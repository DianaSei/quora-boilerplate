require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class RemoveColumnValue < ActiveRecord::Migration[5.0]
  def change
    remove_column :votes, :value
  end
end