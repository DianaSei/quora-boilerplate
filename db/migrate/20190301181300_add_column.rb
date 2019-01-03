require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class AddColumn < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :user
  end
end