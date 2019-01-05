require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class AddColumns < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :questions
    add_reference :answers, :user
  end
end