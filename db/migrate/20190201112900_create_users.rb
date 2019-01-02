require_relative '../../config/init.rb'
require_relative '../../config/database.rb'

class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :my_email
      t.string :password

      t.timestamps
    end
  end
end