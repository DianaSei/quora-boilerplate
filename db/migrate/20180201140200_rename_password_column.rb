require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class RenamePasswordColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password, :password_digest
  end
end