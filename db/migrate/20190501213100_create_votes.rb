require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
    t.belongs_to :question 
	t.belongs_to :answer
	t.belongs_to :user

    t.timestamps
    end
  end
end